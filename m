Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C726B764
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.130.215.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171093; cv=none; b=o77kNir9AIo7HBc8ZV6RoaY7y66xWzrhq4rw/uX/Dlo4H8ruMWe5OCVT15C0/bQwd5dnwgDUPxit3WBC0mKkV8xgNbeu3E4p5EXbDEDYiZ5aepOSAoPM8hG3yTZyMZR2zGD6xE1DySU9X+stPanGwSNEK35VM5YnVVTYhRNvu3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171093; c=relaxed/simple;
	bh=q11Jkl7ykugtresnqGt7DAEKk2HbQUCNSXsZlrPN9pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OquKJOsi/NbxxSeIerEQds1ehDIauIRHE7T6RTylGX5HtKyzmus3ZVyop/axUaGgWj69qbtpNM/9B+XgE9h0boedafCXvYFChQKGBtFy/veyjCp+OMW7/8PUxRFp1yRT5HuvcIAWv54ShswjgHK0nLznPtJytWcy0e1EpD3koQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com; spf=fail smtp.mailfrom=citrix.com; arc=none smtp.client-ip=104.130.215.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=citrix.com
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.96)
	(envelope-from <roger.pau@citrix.com>)
	id 1woOXx-00BgNb-1r;
	Mon, 27 Jul 2026 16:51:21 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224] helo=localhost)
	by xenbits.xenproject.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <roger.pau@citrix.com>)
	id 1woOXw-00FxMZ-3B;
	Mon, 27 Jul 2026 16:51:21 +0000
Date: Mon, 27 Jul 2026 18:51:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	yannick.martin+kernelorg@okazoo.eu
Subject: Re: [regression] Bug 221745 - PV DomU ballooning driver init issue
Message-ID: <ameMgwuUIhZbslHh@macbook.local>
References: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info>

On Mon, Jul 27, 2026 at 10:42:25AM +0200, Thorsten Leemhuis wrote:
> Hi Roger! FYI, it seems your change 0949c646d64697 ("Partial revert
> "x86/xen: fix balloon target initialization for PVH dom0"") [v7.0-rc1]
> caued a regression. For details see
> https://bugzilla.kernel.org/show_bug.cgi?id=221745
> 
> To quote the initial comment:
> 
> > Since commit db8c4b1 (Partial revert "x86/xen: fix balloon target initialization for PVH dom0"), xen ballooning fails to init correctly on domU (on amd64 arch) with the following configuration:
> > 
> > -- xl.cfg
> > ...
> > memory      = '2048'
> > maxmem      = '4096'
> > ...
> > --
> > 
> > -- domU balloon dmesg (init fails)
> > [    0.908337] xen:balloon: Initialising balloon driver
> > [    0.940721] Extra pages underflow current target

Yeah, I'm afraid the original fix commit didn't fully fix the issues,
so there's the following change (chunk below) that's needed
additionally to cope with memory != maxmem on PV guests.

I've done some basic testing and it seems to solve the issue, could
you give it a spin also?  (just to make sure I'm not missing anything
else).

Thanks, Roger.
---
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index e7f1d4ca6d75..c20a1ff8292d 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -703,19 +703,26 @@ static int __init balloon_add_regions(void)
 			balloon_append(pfn_to_page(pfn));
 
 		/*
-		 * Extra regions are accounted for in the physmap, but need
-		 * decreasing from current_pages and target_pages to balloon
-		 * down the initial allocation, because they are already
-		 * accounted for in total_pages.
+		 * For HVM domains: extra regions are accounted for in the
+		 * physmap, but need decreasing from current_pages and
+		 * target_pages to balloon down the initial allocation, because
+		 * they are already accounted for in total_pages.
+		 *
+		 * For PV domains: extra regions are not accounted for in the
+		 * initial memory target, and hence need adding to the stats as
+		 * additional unpopulated regions.
 		 */
 		pages = extra_pfn_end - start_pfn;
-		if (pages >= balloon_stats.current_pages ||
-		    pages >= balloon_stats.target_pages) {
+		if (xen_pv_domain()) {
+			balloon_stats.total_pages += pages;
+		} else if (pages >= balloon_stats.current_pages ||
+		           pages >= balloon_stats.target_pages) {
 			WARN(1, "Extra pages underflow current target");
 			return -ERANGE;
+		} else {
+			balloon_stats.current_pages -= pages;
+			balloon_stats.target_pages -= pages;
 		}
-		balloon_stats.current_pages -= pages;
-		balloon_stats.target_pages -= pages;
 	}
 
 	return 0;
