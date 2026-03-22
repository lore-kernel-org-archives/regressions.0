Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED966367F3B
	for <regressions@lists.linux.dev>; Sun, 22 Mar 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192250; cv=none; b=MINqcofIYdw4vC9QCJCkz5tSgWEDlod1zXWYnnNLPUJRonatjHpGfDL5VGG6OL2ZjxBWsC6y38XraHKDLo/TNoEzLGQ9ksd7Xils1CcVgjDWmOfENt6G0pE2lHTsJyDB17LNzl3UKf66u1n0lX5GBwcCrny+jCaFNIPORq7R0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192250; c=relaxed/simple;
	bh=3CZnZL1q2/CTwTURulKmnJqlE4ltoBIElYg+1Az0QjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Owu9z7I/BpfUKRJvZLq7aNIFYVx/Klu+ck4PLMskrGZPA5sGdMBbQI83xLJ4bKKoRkHmx2OkWp5ylP3qmtN3512DzMXGqERRCOsDAh8Sho5FviNiewfnPHugm7ekwf21D+c186YfCgs6kWB/KojgzgfV5vAXZWp/2W5Ewu8GmN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=Yh16yeww; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="Yh16yeww"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509101189f4so30854471cf.1
        for <regressions@lists.linux.dev>; Sun, 22 Mar 2026 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1774192246; x=1774797046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhTEFsim/WyjS90JhPBR0WcVwZa0jebr3VO6BZOaUi4=;
        b=Yh16yewwos7LJPlOAl/4q0VxjOqaC0ENQb/nVXphzEGs96A6ItNEaDARXmX4VE1G6o
         SUz+ivtwanXLLT2ToTbuUGgH5oS8whqJrqtwlbPhz2qQboRnncEG9D5bRQBcb0AngON0
         klvG3jBNA8O9pf1VX5S88wK5PtkKniGHGTBBLX1l2G4uxgn+DgOOeQvpKOGQIXj9+4UN
         7RatTZ9mouVqXZilC5SclyFdC3tNjhipjpCC8/LYfXrDsjWmZS6sE0CdHq0hpGCXG5T5
         6Tst6+PtyrL4N65TPZ9rAU8eYeUNHE+Q5OE/R4wTpgI9fY2fou1aSqI9RkSnaVW+KLGd
         HdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774192246; x=1774797046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhTEFsim/WyjS90JhPBR0WcVwZa0jebr3VO6BZOaUi4=;
        b=CMF75sWa41Wt+jcYN8/3KmarZJaGvA3E96HX40l/DWQ5mMaFdHX7Oh2IicM6FOQ8vm
         6eGMxlqkHKYAYJRffLyIBA+Nt2gsWZZLRyaw85M4tJ6UPnxcQLEz9AMz0s7VCvUlSzJv
         hgkycjJpfWHKJOqyyLe8Zny/oBZ7xL4jwtKr+903sFu9Tg5A/UJ7t98G3t8XRzEbj7bu
         DPOFsB1R/KYbZsiW0RYc41HEQygfMUAa3pG/KTzn0vWeERBWjdGK8pJjVp+fJ+/2dg5z
         MpenTqSwXZ8Q63ta2TfhVJ3yU1UDHyPPDgM8s2geHQPZxe5Yr9Z2sr6Ix/jPAg2vHHrv
         uwSg==
X-Forwarded-Encrypted: i=1; AJvYcCUmg8l81M3fMrFdJDYnSiW561mro3e+vHW0BLg2e5viOcaSfWD1CQk/c81A5Yxmi2zB3XleF/Fh/t6MTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO8CM/Cvxyh0Km4YSWnYQxVw66FPPNjcEFT4XI0ktPC11sebvJ
	3FZ7H83VT/XwN4DE9RzbIBTBzq0yvMDixMui712GkSAjPlErbp7vQN3NfAEifROMZNA=
X-Gm-Gg: ATEYQzxdGvw6FBmgpp07zglkW9vwYh7nGLjsU47oaf0kcNBKud8idZSmqNJo1SC9Gv8
	iYTBCMQFBR+K3O2534KnzxMgoB9mnq3rvRfuUjx+IIlA7hoCFokys1+08xxGcgE4QHC9moN7m4T
	6LhogNYYGkV+wIUdiu0bSea6ZkDMF1lkXVgDs8eQVicoIE+WmaqTmIuYM0tpNQwIphC3YV3HoNw
	68YnlE9IFJEwRNO21BV/bdSNNfta9iwGPm5If1AA7Wp6/bhCnGO50XftbiLmMKDZ3PS9RxkCkls
	OfCcxmeC4AdFAU3QrcbyeQALN3W1iIZpeoCJkPFb0I8frvAoKVVhFjlkyAeP70UAijuI2l2LNUl
	vGQzN/hsIb3GGbR1mg+nuyVbAzKTQCmC+3YYYAZNCUm6loZRdFb+xn4pHro42dtVPn3sGTujb/R
	2TIUb8v5tvrW2Xz1DhHEPdGGByqnXdPi6/SAc9oF58F0YC6RnY
X-Received: by 2002:a05:622a:14b:b0:50b:4f75:c925 with SMTP id d75a77b69052e-50b4f75ce8emr61817241cf.24.1774192246527;
        Sun, 22 Mar 2026 08:10:46 -0700 (PDT)
Received: from localhost (ip-24-156-181-66.user.start.ca. [24.156.181.66])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-50b36e803b8sm61037431cf.23.2026.03.22.08.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 08:10:46 -0700 (PDT)
Date: Sun, 22 Mar 2026 11:10:45 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	x86@kernel.org, linux-edac@vger.kernel.org, 
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: PROBLEM: boot hang on ASUS P2B-F (regression)
Message-ID: <2fgbldvzh3fahs5vipak33alxbn552otazldu6ftamr6reii4t@6syhuc665vys>
References: <mfc7rijyfrtdxj4k6pxqcar7jtqnt6kz77ubrr6iyj52cguesz@qj5uf3to7ukq>
 <20260321204321.GFab8C6aq2jIhIen_p@fat_crate.local>
 <fdhaj5pddf6cp7obvgrpzzxmxn46za4acyvhkvjtjy3ukofmok@hocikxl5b42x>
 <20260321215224.GGab8TGH0c-kmPGUAB@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321215224.GGab8TGH0c-kmPGUAB@fat_crate.local>

On Sat, Mar 21, 2026 at 10:52:24PM +0100, Borislav Petkov wrote:
> Anyway, since you're partially reverting, can you pls try reverting the
> Intel-relevant hunks and narrow it down, if possible.
>
> From the looks of it, I'm thinking:
> 
> * comment out the intel_apply_cpu_quirks() call
> 
> * comment out this hunk
> 
>         /*
>          * There are also broken BIOSes on some Pentium M and
>          * earlier systems:
>          */
>         if (c->x86_vfm < INTEL_CORE_YONAH && mca_cfg.bootlog < 0)
>                 mca_cfg.bootlog = 0;

Making these changes does not appear to have any effect.

I whittled down the revert to the following patch, and this is
sufficient to get the machine booting again:

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 8dd424ac5de8..83eb037d4d46 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2284,6 +2284,12 @@ void mcheck_cpu_init(struct cpuinfo_x86 *c)
 
 	__mcheck_cpu_cap_init();
 
+	{
+	struct mce_bank *mce_banks = this_cpu_ptr(mce_banks_array);
+	if (c->x86_vfm < INTEL_NEHALEM_EP && this_cpu_read(mce_num_banks))
+		mce_banks[0].init = false;
+	}
+
 	if (!mce_gen_pool_init()) {
 		mca_cfg.disabled = 1;
 		pr_emerg("Couldn't allocate MCE records pool!\n");
