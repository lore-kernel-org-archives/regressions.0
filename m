Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384C154C08
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712171681; cv=none; b=AuN9jReN+kuUDRLo43ngaCxE7nl2kZ23Y1N/mXQOJ2vOG+Uz3imFfs3aDYEayyKsduVNINN9c9pGkxcL7Q2PM/P9x7tMo3texPskggdEHHNaLU9gCXkTz1jwqezVjUcwrUhs3W8nsB7kNki+hZ+XpJyZgt/HczJ77r0wAxYNEVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712171681; c=relaxed/simple;
	bh=FJ+t/gDiplQiUtBc16qSLCueyfEyhKBzs5fbOgUf8SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYTy95S2dMuR3vLxxkDRzpdPeBc7zxrE8GLhwJc+viT7s8lwwpwCaWv+Mga3HFM6mxnPZfFjOvEUEJzscz/5edsfYFeNyFu3EIAb/CDpYNn7qhiUxbPufE0qReRopB0uOMrsqnshWRMwR0PX+pp/mskr2NcGudQMOLD/gtUXBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BullExaR; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BullExaR"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e0ae065d24so1103795ad.1
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 12:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712171678; x=1712776478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVpGTxFXS5uXsCBb768x+7/nyj1uORz4WNXl8EbIhlU=;
        b=BullExaRhWPBgGr4dCQf7QzcZNc3XLAlc9fY4deXFwPm/pxdimQlQHRFj5LDQs1Ezm
         FngMFy/WdqRE5evqbrOFHpuvuiCUrgLVCul7O73Ka5cIKDTad0nGQt4VPupStXCZevW2
         X3RwwNTLOvqez5sBG84ocNZzMU7ozfU5ljJPOc+mpZiClKFHPc+qF2LSTsSy1FVUz8pz
         C1Am4+tKdgaYQKqo1H8WYW5grCHqClGE9jevZ+ybRTwUDpRtLVBeML1opeHjMOHR/K/b
         izyCUDCN4a8UoH2fXUgfUvVMUbzNEk1P3YjfOT0OWcxjn1cip1UJdSYbXqqpuQ8oITxC
         nlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712171678; x=1712776478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVpGTxFXS5uXsCBb768x+7/nyj1uORz4WNXl8EbIhlU=;
        b=cMgpg56RY/7+2aAsaXr+Bw6LOyJcm6V/cRMgrwf1Syra2FuAdAg6BT2/VbKT51Edsu
         R7It6G8GiTyyYaz/W8oC/dp6xidifprW+g1nq3sSdFrWXvI7bIm2FsrG5kc0H/h3rmjp
         TVr7kQEpRYi4W34stkfh+rHmqawtHOba9Kz173bqGxjgCPXVHNwDYUtQZHwulvpivAj0
         bKT/ijII+slj8kGP6aJXstFhVtZCRCQMqlozx880mhnAjyTKBRA1SMjwfJICTEN0pE35
         rbjLnB8jxd7dA+V88dG1KwoL0XN1Or6ZYx6p9Nowj58nyPCcR58W4FS4KAon2qNCIoWt
         vqXw==
X-Gm-Message-State: AOJu0Yz/0ZWRP4bVNOd0/maNjfTSDZ92wPv0yyGW3dgaH5Tpkf3jZZ2u
	Sob4phpYwCbjL9mPxRkWD4srfOdMM8cB2pgZfpabhNvpyLfLkHpqGBKdq4Xi
X-Google-Smtp-Source: AGHT+IFjVj+8On2PFUPVYQMCQadRX0E6HTfgGElVggaP9InZtQw2So6f/WRTROp6i8r8ixwluZ/syw==
X-Received: by 2002:a17:902:8c97:b0:1e0:e85b:b9ca with SMTP id t23-20020a1709028c9700b001e0e85bb9camr162971plo.21.1712171678270;
        Wed, 03 Apr 2024 12:14:38 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:25ab])
        by smtp.gmail.com with ESMTPSA id kx12-20020a170902f94c00b001e0b5eeee41sm4201776plb.38.2024.04.03.12.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 12:14:37 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 3 Apr 2024 09:14:36 -1000
From: Tejun Heo <tj@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: Bug 218665 - nohz_full=0 prevents kernel from booting
Message-ID: <Zg2qnEgOo9CaFwgB@slm.duckdns.org>
References: <5be248c6-cdda-4d2e-8fae-30fc2cc124c0@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5be248c6-cdda-4d2e-8fae-30fc2cc124c0@leemhuis.info>

Hello, Thorsten.

On Tue, Apr 02, 2024 at 10:17:16AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developers don't keep an eye on it, I decided to forward it by mail.
> 
> Tejun, apparently it's cause by a change of yours.
> 
> Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
> not CCed them in mails like this.
> 
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=218665 :

This looks like the same problem that's being discussed in the following
thread.

 http://lkml.kernel.org/r/20240402105847.GA24832@redhat.com

Hopefully, we'll soon reach a resolution.

Thanks.

-- 
tejun
