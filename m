Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304402222CF
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898497; cv=none; b=BpJsBnXP7uzyeAichkmxO2d5fvYxK5gf1sj8elJbdU85jll8jGRpxToNfabve94YxNKFan5VUNAgoWWHxjBOx0FItSjEULtavj5w0MclVPCbhMdTuApFL13S7EEyjyGQyrG0OSIZMEI0Q24cONbXg/AGlkTEwnvo7QsBs+7gl7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898497; c=relaxed/simple;
	bh=dP7GL+thuENnOa6QljHoFx/ji9d+kmAW2+rgC7oF2fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEpEK01putmKeG47Hcw+VqT2kmB6S12t75QrBKhVIxrQ8njefh5pCiRKzYm4er7JroTRZM9zHyzxsOq3A50o41huMc/koQMAxUaUWj9M7sxQv00IsaEW4QQk5w/0Hp+LK7DFGP36EY+2psj3GtswxkTf1YII970SvY8808I+D5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wikimedia.org; spf=pass smtp.mailfrom=wikimedia.org; dkim=pass (1024-bit key) header.d=wikimedia.org header.i=@wikimedia.org header.b=UN0nO4kg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wikimedia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wikimedia.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wikimedia.org header.i=@wikimedia.org header.b="UN0nO4kg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a374f727dbso2969311f8f.0
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wikimedia.org; s=google; t=1747898493; x=1748503293; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KfxvhkcdHh5OvwBCnveBRjxTNcmjBDdwmwzm2nmg9UQ=;
        b=UN0nO4kg7dFOBE176tS2+Fq/R4t8aMeZqrydDOn4BX+EpNbM7cLBnZC8mlmu7twUIb
         XzIHMQMsSly5dzALrShtt1AlAgaNA0O0rnpyhrWQWS1ODzVliKQ8+wBsf8SZogZ1L4xd
         IYjpIh5w5DbeqA8m9y+6QKHprPUrTYI7SugyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898493; x=1748503293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfxvhkcdHh5OvwBCnveBRjxTNcmjBDdwmwzm2nmg9UQ=;
        b=sdQ1l5U3Nh8heDNVRVOjzcqVbDG2lw0zYJcMOMNhawKDcl4fyyyzhvd6dLwVCDE7AN
         ERt58XL8ki073RgkM3dTAVxUzCxQDgcFrqh4Rm4lVXsdhJmQ7D/vo44j45WhTWRzYixz
         vZR54x7ZwyWunq+AKthTVIgo+1VfoqwmPBLmFGwbBWMnWlBtfwFECTMjq4ZYYcg1yVC7
         AYiDsygy/3UAujNAHQpU1ZBMXp3X9ibgyKzsUm7vvwCTn8T+7wFpbB0vteoaS5jLDOCh
         qd0+PDOIynSf/fIZsV0P9U75AGPQE6/sL+pK1r/bDJClAXsgqwSqAWwJtXMCygdCZiDj
         /FgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0KM/Qm4qicMngewC/OFbGFzM40Pe5yKgRd6c/w8CECPi7JMluk7+WWc1Q0Qhij7djY6fr2lbFX3dXOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3ihsYodwUI42gNhYhnfBQGZBAg6Q0FHwSgfW+cJ66Sm90uXSE
	XdaIe4VjbrZY8KKzzUQFHTDdUMNL2LV2PuDjoSASCnV4t4J/O/8Q5GpSXKx3W0G7U7U=
X-Gm-Gg: ASbGncuTY4CoJWIQyfPkmKrNrDdj4N047zY/+Jd6f4RiVE2J9+58fTVADCIPh01H+ke
	4UQGEIWH6k2gQuxYxFxbFIvogTEnJ0xDVCSW3svoYX/vJ95d61adTnZi8JAC6gmNVwZ5NnhwThx
	eV10xIU+KVHihlV737XZ+NIPVvszJbiB1FrZnRvzETA0jrHYkjY7vWOgxtxIYNXQznaOX0+igTx
	eGlVQM+ibX8qxFk/s59hM8HM+p2Mpcm9R+oYQ/avGIWOHwHHz4fUbY4Bg+tt2vHn/8n8jDVBRGn
	nYnCCT2ODWHzu32juUQNgIwkA1Dc9eu/+teZXbWzrtdG8wjpg+CQaW1qoWoMkVWp48he7saV/Ms
	NOttiVhi5a3bx1zzu6+TsaCgmVFTGoH7iwc7/5GX47rHq6Ow4GlvSIkS9F7U=
X-Google-Smtp-Source: AGHT+IFJ+Cy/G9oDt5tGwRat5x4LMKsb47Oeo6C29nhqA419f+nEUolSDMFo2oB4LIUOz9WtzgKh5Q==
X-Received: by 2002:a5d:5f4e:0:b0:3a3:2aa4:6f6b with SMTP id ffacd0b85a97d-3a35fe5c59amr20067082f8f.1.1747898493480;
        Thu, 22 May 2025 00:21:33 -0700 (PDT)
Received: from pastis.westfalen.local (p200300f5ff135a000b0fb2ee3a2e2937.dip0.t-ipconnect.de. [2003:f5:ff13:5a00:b0f:b2ee:3a2e:2937])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0aadsm93187195e9.12.2025.05.22.00.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 00:21:32 -0700 (PDT)
Date: Thu, 22 May 2025 09:21:29 +0200
From: Moritz =?iso-8859-1?Q?M=FChlenhoff?= <mmuhlenhoff@wikimedia.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: Regression between 6.1.135 and 6.1.139, possibly related to ITS
 mitigations
Message-ID: <aC7QeZiJVuURxptu@pastis.westfalen.local>
References: <aC3R_CCacqN9XmiL@pastis.westfalen.local>
 <aC43zcG1v0A0J9Hp@eldamar.lan>
 <5d97e611-919e-45fa-87e5-00a489870f8c@oracle.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d97e611-919e-45fa-87e5-00a489870f8c@oracle.com>

Am Wed, May 21, 2025 at 11:24:52PM +0200 schrieb Alexandre Chartre:
> 
> > > On Linux 6.1.135 every works fine with both the 20250211 and
> > > 20250512 microcode releases (kern.log is attached as
> > > 6.1.135-feb-microcode.log and 6.1.135-may-microcode.log)
> > > 
> > > With 6.1.139 and the February microcode, oopses appear related
> > > to clear_bhb_loop() (which may be related to "x86/its: Align
> > > RETs in BHB clear sequence to avoid thunking"?). This is
> > > captured in 6.1.139-feb-microcode.log.
> > > 
> > > With 6.1.139 and the May microcode, the system mostly
> > > crashes on bootup (in my tests it crashed in three out of
> > > four attempts). I've captured both the crash
> > > (6.1.139-may-microcode-crash.log) and a working boot
> > > (6.1.139-may-microcode-noncrash.log).
> > > 
> > > If you need any additional information, please let me know!
> > 
> > After looking at your crash logs in more detail, I suspect that your
> > issue is the same root cause as spotted as well for the 5.15 series in
> > https://lore.kernel.org/all/81cd1d38-8856-4b27-921d-839d9e385942@oracle.com/
> > 
> > I assume you can confirm as well that disabling the ITS mitigation
> > with indirect_target_selection=off makes the system boot?
> > 
> > Regards,
> > Salvatore
> 
> And this should be fixed by this patch:
> 
> x86/modules: Set VM_FLUSH_RESET_PERMS in module_alloc()

Confirmed: Running 6.1.139 plus "x86/modules: Set VM_FLUSH_RESET_PERMS
in module_alloc()" resolves the issue: I've rebooted the affected server
four times with a custom build and the oopses are gone and it reboots
reliably.

Cheers,
        Moritz
