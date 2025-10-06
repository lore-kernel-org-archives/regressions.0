Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEFA6ADD;
	Mon,  6 Oct 2025 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753342; cv=pass; b=hOSuplILs/8M2Shqd7BwZQqUbKkIEy66lCg4za5UilATHqlB9Tu6GhhQW/SBLIS7hZTxctTRZlKQxGF/31Elh5HqsIiAWPdOOrRwprc6YcWceSwzJ4Xup2Y2uCK8So5UqUHUoz/ifHWzK25xCwhYqd+WnhflX6cD01xSsSRrsyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753342; c=relaxed/simple;
	bh=Cfb7FRjFZmCB8vUEgOuDDxx/haSXnMo8EqJA8oc9EJg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=U3KkPBbAkbin4KMA0qwYwpiWI9OJBGCSA+pwTkixWk96OmtniHpO6fRg4i29uksP3l7iVWyP81z25xPL5M5E0Y7VY1wcpSB6bU+Fjn1wrCDdmwmS4dOn/JMumTxn7x6y+jqCdBI58f87S2hYbjQZLaovieK7y+giMMDT67WFfm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=GyldJFDq; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="GyldJFDq"
ARC-Seal: i=1; a=rsa-sha256; t=1759753338; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZqGPp9bcqisQgCoM398DqFAmvMikl4FemjQkWz//frBhJGnEwzrVb9XZuRyAok7lyW8tehn6yD83l3g1uGUwaD3BIdmfO4kSVSnLX9cYvdnjHHnGFR+NjbXZRL0Tr6RlisXRrx8ek8CM+9/aIi86NY3wIAoYRtT0PC97veISO/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759753338; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0PGjF5NxhYIIid/zoNg6qd3BG9reBVQfm6q4DIfg9L8=; 
	b=OVtpkDTW3QzpMU7TYIsbq5zwIFRS58LOnp4aoY0h197DNs4TDtnkLaYzeubKisf8ZDsk8y559/S53DgZzi+FL1hsATPQku6fITaRX3aZP7bX3Jr+3VEk57595llUb5k12koDNjF+7N6u5WokTda/r4TRiXvlj5DHYTI1BDP2Egk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759753338;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0PGjF5NxhYIIid/zoNg6qd3BG9reBVQfm6q4DIfg9L8=;
	b=GyldJFDqdNqUSVybUZDnOfv1d1rMtPVALYKdHucgTCwruOodqFi+yUrFPA2FSTyH
	xzqwBf/qhUX9DoPDaLQkrexTqnb+jGo+CyWFdpu/VUI5J+2TatuH+VuYBjiLgEdJ6Ap
	AxUDvDfev9iQ10+mKN0svtMaWgkerH1egC8NZE1Q=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1759753336091770.3359606843917; Mon, 6 Oct 2025 05:22:16 -0700 (PDT)
Date: Mon, 06 Oct 2025 09:22:16 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: "Denys Fedoryshchenko" <denys.f@collabora.com>,
	"kernelci" <kernelci@lists.linux.dev>,
	"kernelci-results" <kernelci-results@groups.io>,
	"regressions" <regressions@lists.linux.dev>,
	"linux-next" <linux-next@vger.kernel.org>
Message-ID: <199b978f4fb.49020b682270448.1218727940872425598@collabora.com>
In-Reply-To: <bccbcccb-a3db-4b34-962c-14e79cc8bece@infradead.org>
References: <175890594349.36.5014274970333071394@1e895cdadf47>
 <bb21b532-b68f-4c02-a9bd-7e8aa3c07258@infradead.org>
 <b10bcf92dfd2fc13ed90b4da6e9ab8a3b61ce724.camel@collabora.com>
 <19995464e11.7f75fad1483203.4516273948739211660@collabora.com> <bccbcccb-a3db-4b34-962c-14e79cc8bece@infradead.org>
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail



---- On Mon, 29 Sep 2025 12:34:02 -0300 Randy Dunlap <rdunlap@infradead.org> wrote ---

 > Hi, 
 >  
 > On 9/29/25 4:40 AM, Gustavo Padovan wrote: 
 > > Hi Randy, 
 > > 
 > > 
 > > ---- On Mon, 29 Sep 2025 01:15:24 -0300 Denys Fedoryshchenko <denys.f@collabora.com> wrote --- 
 > > 
 > >  > Hi Randy, 
 > >  > 
 > >  > On Sun, 2025-09-28 at 18:13 -0700, Randy Dunlap wrote: 
 > >  > > Hi, 
 > >  > > 
 > >  > > On 9/26/25 9:59 AM, KernelCI bot wrote: 
 > >  > > > 
 > >  > > > 
 > >  > > > 
 > >  > > > 
 > >  > > > Hello, 
 > >  > > > 
 > >  > > > New build issue found on next/master: 
 > >  > > > 
 > >  > > > --- 
 > >  > > >  undefined reference to `pm_hibernation_mode_is_suspend' in 
 > >  > > > vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) 
 > >  > > > [logspec:kbuild,kbuild.compiler.linker_error] 
 > >  > > > --- 
 > >  > > > 
 > >  > > > - dashboard: 
 > >  > > > https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893 
 > >  > > > - giturl: 
 > >  > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
 > >  > > > - commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f 
 > >  > > > - tags: next-20250926 
 > >  > > > 
 > >  > > > 
 > >  > > > Log excerpt: 
 > >  > > > ===================================================== 
 > >  > > >   LD      .tmp_vmlinux1 
 > >  > > > ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function 
 > >  > > > `amdgpu_pmops_thaw': 
 > >  > > > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: 
 > >  > > > undefined reference to `pm_hibernation_mode_is_suspend' 
 > >  > > > 
 > >  > > > ===================================================== 
 > >  > > > 
 > >  > > > 
 > >  > > > # Builds where the incident occurred: 
 > >  > > > 
 > >  > > > ## cros://chromeos-6.6/x86_64/chromeos-amd- 
 > >  > > > stoneyridge.flavour.config+lab-setup+x86- 
 > >  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
 > >  > > > (x86_64): 
 > >  > > > - compiler: gcc-12 
 > >  > > > - dashboard: 
 > >  > > > https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b 
 > >  > > > 
 > >  > > > ## cros://chromeos-6.6/x86_64/chromeos-intel- 
 > >  > > > pineview.flavour.config+lab-setup+x86- 
 > >  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
 > >  > > > (x86_64): 
 > >  > > > - compiler: gcc-12 
 > >  > > > - dashboard: 
 > >  > > > https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e 
 > >  > > > 
 > >  > > 
 > >  > > Is there a URL for the .config file that causes the 
 > >  > > build error? 
 > >  > Yes, 
 > >  > https://files.kernelci.org/kbuild-gcc-12-x86-chromeos-intel-68d6bd59aabea828fddae00e/.config 
 > > 
 > > Out of curiosity,  have you tried to find the config in our Dashboard? We added basic information in 
 > > the email report and then the Dashboard link take you to our comprehensive report. 
 > > 
 >  
 > I did look at the Dashboard first but it seems that I overlooked the config file info. 
 >  
 > > 
 > > Any feedback here? 
 > I would rather not use the Dashboard until I need to dig deeperinto the problem. IOW, I prefer to have the config file URL 
 > in the email report. 

Thanks for the feedback. We will work on it this week.

I created https://github.com/kernelci/dashboard/issues/1551 for following the progress.


Best,

- Gus

