# Branch Protection Strategy

## master (Production)
- Protected by GitHub **Ruleset: Protect Master Branch**
- Direct pushes disabled
- Force pushes and deletions blocked
- Requires pull request and code review
- Requires passing GitHub Actions status checks
- Requires approved deployment via GitHub **Environment: Production**

## development (Dev)
- Open for collaboration
- Used for preview/testing of changes
