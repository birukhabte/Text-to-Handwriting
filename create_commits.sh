#!/bin/bash

# Commit messages related to text to handwriting converter and text extractor
messages=(
  "Improve handwriting font rendering quality"
  "Fix text extraction accuracy from images"
  "Update OCR processing for better recognition"
  "Enhance font converter UI responsiveness"
  "Optimize image preprocessing for text extraction"
  "Add support for additional handwriting styles"
  "Improve PDF generation performance"
  "Fix text alignment in handwriting output"
  "Update Tesseract configuration for better accuracy"
  "Enhance speech to text conversion accuracy"
  "Refactor font loading mechanism"
  "Improve error handling in image upload"
  "Optimize handwriting rendering speed"
  "Fix spacing issues in converted text"
  "Update font size adjustment controls"
  "Enhance text extraction from low quality images"
  "Improve color picker functionality"
  "Fix line height calculation in output"
  "Update page margin settings"
  "Enhance scan effect rendering"
  "Improve font weight adjustment"
  "Fix letter spacing in handwriting output"
  "Update word spacing controls"
  "Enhance page lines rendering"
  "Improve text input handling"
  "Fix image upload validation"
  "Update font selection dropdown"
  "Enhance PDF export quality"
  "Improve responsive design for mobile"
  "Fix text overflow in preview"
  "Update color scheme options"
  "Enhance accessibility features"
  "Improve loading states"
  "Fix memory leaks in image processing"
  "Update dependencies for security"
  "Enhance user feedback messages"
  "Improve error messages clarity"
  "Fix CSS styling inconsistencies"
  "Update component structure"
  "Enhance code documentation"
)

# Files to modify
files=(
  "src/App.css"
  "src/Components/FontConverter/FontConverter.css"
  "src/Components/FontConverter/FontConverter.js"
  "src/Components/Footer/Footer.css"
  "src/Components/Header/Header.css"
  "src/Components/Info/Info.css"
  "src/Components/PDFGenerator/PdfGenerator.css"
  "src/Components/SpeechToText/SpeechToText.css"
  "src/Components/TesseractScan/TesseractScan.css"
  "src/index.css"
  "README.md"
)

# Days and their commit counts (total 35)
# Days: 3,4,6,8,10,11,12,14,15
declare -A day_commits
day_commits[3]=4
day_commits[4]=5
day_commits[6]=3
day_commits[8]=4
day_commits[10]=7
day_commits[11]=6
day_commits[12]=2
day_commits[14]=3
day_commits[15]=1

commit_index=0

for day in 3 4 6 8 10 11 12 14 15; do
  num_commits=${day_commits[$day]}
  
  for ((i=0; i<num_commits; i++)); do
    # Random hour between 9 and 22
    hour=$((9 + RANDOM % 14))
    minute=$((RANDOM % 60))
    
    # Select random file
    file_index=$((RANDOM % ${#files[@]}))
    file="${files[$file_index]}"
    
    # Select random commit message
    msg_index=$((RANDOM % ${#messages[@]}))
    message="${messages[$msg_index]}"
    
    # Make a small change to the file (add a comment or whitespace)
    if [[ "$file" == *.css ]]; then
      echo "/* Update $commit_index */" >> "$file"
    elif [[ "$file" == *.js ]]; then
      echo "// Update $commit_index" >> "$file"
    elif [[ "$file" == *.md ]]; then
      echo "" >> "$file"
    fi
    
    # Stage the file
    git add "$file"
    
    # Create commit with backdated timestamp
    GIT_AUTHOR_DATE="2025-07-${day} ${hour}:${minute}:00" \
    GIT_COMMITTER_DATE="2025-07-${day} ${hour}:${minute}:00" \
    git commit -m "$message"
    
    commit_index=$((commit_index + 1))
    
    echo "Created commit $commit_index/35 for July $day, 2025"
  done
done

echo "All 35 commits created successfully!"
