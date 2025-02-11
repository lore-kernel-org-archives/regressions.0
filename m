Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7D23A0
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 00:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739233427; cv=none; b=BAqXDOyn0vBi7PqGk434ZWSCx17m7Hi4kKy3VpTcXvGisV8m++zRhnlUgusSUjRZv5hOmASY2la05tTUmsgEHsNMCF9me6C0aoVoLIn8SJyoxnucGqM9VciUwwFvg+fl+LS0okVf8JLgmYcxpwVn8UhVjFp/rkA3+LXa6nmt18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739233427; c=relaxed/simple;
	bh=chW9OIPb5ntbVCr7d0tbNxGmYViLta9khUpxt/ZD80c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwit1gxsqdnpJzrEnCvC+mdKcHWgwjrp9+Rxw0ql45F8uxCBHdDUiZXMls80F7n+czT8L4kI65icpvKWTPqf6zG6OGB/LBH9l8dBTgiRnrAfHQAinkYzrEke3ADWxRo2mcXWJr0/RAJYn9mFgWU03KPN8ds3+fOiwJnjkpFPKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBdswjyk; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBdswjyk"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so5773860a12.2
        for <regressions@lists.linux.dev>; Mon, 10 Feb 2025 16:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739233424; x=1739838224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sd2FUPh0dF8GgciixwOqtbSkDaCYkxNrRhz90b6befA=;
        b=OBdswjykNpTOfFa85144Le2cTYeqNuJHJsAaHcSp86erTPxeGNATEaSCFfCsnKdVp7
         gVBRssL8vvqihCkDcvnqbsbgwrQ1Ktn4pVn9zLTNII0sY3WP7+GMkj8a1Ar0+XYNgUzR
         bRlWtezfxOR9VfV9QXJdSq4jhrQJ7xT9BiMciw8RHu0iIi5mjimfIPPK+6E3HgC2AXdl
         qUnCc0iSZP+okAT5OV9ZxyPsyC50B6uSNrQ7ch1nuDZjNjI7MYWJBf2XyRFmJI1LvXqH
         yV+yrJo9aM1qhLvi+h8Ay6PcWo9tyg/EmkHWCGkpZBDL7b7VA2O25tHIfvAEQ5ppIUp2
         CXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739233424; x=1739838224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sd2FUPh0dF8GgciixwOqtbSkDaCYkxNrRhz90b6befA=;
        b=tDbX31TwtkJbKdzSRl2JQRan6laf4nnZnaTGHeQmLWS5i4h5kMF+ZCn61S3j5tdcue
         9j6LG5d28FZqOePCSyo6FLyZx0qoxxJBurpslmAXUAGxDQ/QOdKONh2CR/d9eBbSkic2
         GaXvYJC44D87Hmio6aMpheXo26Qyzr+hrbAJ/FtiDPS/cDavNcjASTx6wsa6Yeu7lvUL
         UpPmn3dY1oE0WVvOyPeKxCznS9ojA+JhJ9iyhNruQlBrurINW5cY7QCoOB2SSVgm9ipv
         OXvxJPNMdx/MXYFV54iHdTYSoMK/xziRao2r0XiR5prRMu702kHDRb6C7mT0LUkANFQa
         lOrA==
X-Forwarded-Encrypted: i=1; AJvYcCULZGrw3A8+K1eglsuuNW2Q8OajJCDkoUCHpsFDpKhkl6PGrJGxRjdP/mIk89rssWTrwQRxkUqcYG3ueg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yze7oobCjSjTpi8aeHEa9YYwq79Qs4wkTGGY8b0Z+EALbmdhr8v
	XuIeX4rmIrtZJOrvKqcLA1Y9S2AKNdrrxAAd3pqZe/w9XYVAwfqlA4iA9m5V
X-Gm-Gg: ASbGncsgjOlXdYcnv8SFlCZ0VmJlGabsYIOkLmQDG6xBKxb+R+ZkoIfkkIEcxRPIEn7
	Sx/zEAx7MAvnffsFmvCGsS1W4M43w5C5B6FFFxbUZnLCDySt4BeZb0Mh+2x2r6XIT3gEuS/kbcg
	QCW3Sp8l2mtOcF8z4RZ22xvZFIWz025AQuU8Zdjh+U8tsPez/LzWXNHmZ3EBsdNTO+7qr4ws2Qd
	jwnUeZfUPAI6ACnZIJ9wjZpUHVEMQLTiA9abWe9T0FTmELVYk/+61Fn4yLaJCSJmeZH/bJh92tt
	GnNbnQa9N65YrhhfYwINcLm9dWkmuSMp
X-Google-Smtp-Source: AGHT+IEAx3UNYfuVlb/plbs5DImdmWiy5DDrylpKFoP3GwL0TOjmR3y/h59/Ds2BcmeOFU3JdDu8bg==
X-Received: by 2002:a05:6402:5111:b0:5dc:7464:2228 with SMTP id 4fb4d7f45d1cf-5de9a39445bmr1588878a12.2.1739233423683;
        Mon, 10 Feb 2025 16:23:43 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5e15c76bsm5826074a12.42.2025.02.10.16.23.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 10 Feb 2025 16:23:42 -0800 (PST)
Date: Tue, 11 Feb 2025 01:23:29 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev, Kenneth Feng
 <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Boyuan
 Zhang <boyuan.zhang@amd.com>
Subject: Re: [REGRESSION 6.14][BISECTED] AMD Carrizo shutdown hang since
 amdgpu commit ff69bba05f08
Message-ID: <20250211012329.75c58e60@foxbook>
In-Reply-To: <CADnq5_PaMfk65E2NRwPcsr-+bF6iKc8Le4mRkye9BZ=c4xQ-yQ@mail.gmail.com>
References: <20250210191518.351576aa@foxbook>
	<CADnq5_PaMfk65E2NRwPcsr-+bF6iKc8Le4mRkye9BZ=c4xQ-yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Feb 2025 18:28:16 -0500, Alex Deucher wrote:
> Does the attached patch fix it?

Yep, it prints a few more lines and shuts down now.

Thanks!

[   53.525125] cstate: 1 pstate: 1 nbpstate: 1 sync: 0 dispclk: 0
[   53.525125] sclk: 0 sclk_sleep: 12225 yclk: 2668000 blackout_recovery_time_us: 0
[   53.605942] amdgpu: Setting Deep Sleep Clock: 1222
[   53.613220] amdgpu: enable Low Memory PState.
[   53.707787] amdgpu: Setting Deep Sleep Clock: 1222
[   53.714787] amdgpu: enable Low Memory PState.
[   53.721659] amdgpu 0000:00:01.0: amdgpu: IP block9 already in the target gate state!
[   53.732460] amdgpu 0000:00:01.0: amdgpu: IP block8 already in the target gate state!
[   53.742564] amdgpu: Setting Deep Sleep Clock: 1222
[   53.750680] amdgpu: enable Low Memory PState.
[   53.759500] amdgpu: enable Low Memory PState.
[   53.767937] ACPI: PM: Preparing to enter system sleep state S5
[   53.777664] ACPI Warning: Time parameter 255 us > 100 us violating ACPI spec, please fix the firmware. (20240827/exsystem-142)
[   53.792988] kvm: exiting hardware virtualization
[   53.801592] reboot: Power down
