Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6015ECFF
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719841382; cv=none; b=eTHHnNmnzj0ka/c18T8qwI5YDLfVdlsw6CTb8DAoXEYMAu/3UEsBhUGVi48PwPKOVR7PZTkbBA/d4qTbnYOGey0O3fZQa3CyfjqrMmKPHOO4d3mAUyLPQ0JoXHkLCxa585Bvm/WmqUOewMgdak+O4H7sIArgnKnj+sXiwqSm/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719841382; c=relaxed/simple;
	bh=6TJrdqdGOFUfNAc2K8v9vR/tcthQDljpvcHgKkBQdV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6FICP03Md4KspO0vWg5rtVrVVQBg44laSQyytjLQTSasjxBzGxnIiVo8Bs7TFPrC8EoRIw68VK+TIQwo3dupQRHUMZGVZ0EbYMLWJcWzJ/syhziPpo8ULsVufuKzdukYLAzrB7HGbORKSDymBt1OLrq1Xeg0lK2TtKITOL7R5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFVVnNS2; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFVVnNS2"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-48f5295f81cso1020914137.2
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719841380; x=1720446180; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QzDzN8qMadfykp4fLzSl/Fe/+BqVWg+52h9oZmO7PNo=;
        b=uFVVnNS2OXMymltBRNU7D3IEfuEvSB/YS/5v5Ov0458ntSYkWxcGvx1B1a6xmsFcYM
         sa2aSyAivpoOadNSR125z+NpfZK49hITm1SQ6Lu7buZm4nVqRvwR3rNG/GEr3h7gkJvu
         oVd4SPyUloze9b/tqLVod22ZXqPzkPXf0XGMusTKZY19085oyUyUZI6rK4C8Yk68BX2k
         fgjdqno9WiRGqowxopK1TCmrohewM9XHtRPlzR4L3SukMi0M3BtPcYlQGZEYWOQINNik
         61wIAO757/aIbnzriuhod0tTqmSe/RuTuHJTZ+6Ytwq66HUrvf9EB4OlZaHBUvxv4Z+p
         9MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719841380; x=1720446180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzDzN8qMadfykp4fLzSl/Fe/+BqVWg+52h9oZmO7PNo=;
        b=hlqSf9dK12HErxoCJtn+QmrX14y4iPFYYOZLuMJ0R1R6yrEgRuB1/BadOEDNu+igHO
         7+yc09GWImDjCAQDkYHDalBP5JstbkOygvlJQpp8uuI43tyMEKKUbGhKL6N/kjhdQhMR
         44cBpmz6ohQmZmM6cUaCjvAWvGROb6b33uM58G8NjCriS2q6LldbWCIhOtm/0Tk64p8f
         2VxZ1Mk+u4xc6AgY4yeI2a2LZdRE+txNwWDiA7Tf04SRhlSD5GvR6DJwhGyVfIuu4PS4
         C3tOKnm0BLOAYYiNH5vkWo14oSqifUeS4/4j9JV1pbRRH/06UoQm/XoA+IRPM8FnDswd
         62tA==
X-Forwarded-Encrypted: i=1; AJvYcCXUdl2MMePQpOBHxTvVK9mdbX82bfLfbrlmm3/vEgb8IMvDHynxqdia37EgJe2/6fdsSttWqQIdVKpEYA07ZuGwD74A8L8Hkol7LeU=
X-Gm-Message-State: AOJu0Yz4RJUYQn7mhkGzyHKr4ZgTVKMtBgTa77Tog5p92ayc08SrTWlY
	CpnuHFp2g8mHAr6gG3CG6f6kIcvAMdYVHGc8/SzwoM2z87BEdGkZT9/NRiO5u1j8RmD9tZEtK+B
	76YIdpmz4yFljiqDUbxOtuhLtRVoUSpXOdo5HrA==
X-Google-Smtp-Source: AGHT+IEiXUSbYSAJMo84UhUarOx3CsnYlrPxZyKJQGlBzRnCF/WKnt/Ht7O8aq6MeKZvdwlxYEkKcMyqbYdByzcAwDk=
X-Received: by 2002:a05:6102:3109:b0:48f:8be8:970f with SMTP id
 ada2fe7eead31-48faf15a142mr5297794137.32.1719841380229; Mon, 01 Jul 2024
 06:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsXsbHp+0cWoTjEhkpANOav=GLSjPx5ghtUY-FjMPyoSQ@mail.gmail.com>
 <20240701124733.GB2095@willie-the-truck>
In-Reply-To: <20240701124733.GB2095@willie-the-truck>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 1 Jul 2024 19:12:48 +0530
Message-ID: <CA+G9fYu2GQXEWECWHi0LZZ_UsMSPGaJ1ORKTR8k_E_LuYteLAA@mail.gmail.com>
Subject: Re: Mainline: v6.10-rc6 boot failed across all arm64 devices
To: Will Deacon <will@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Mon, 1 Jul 2024 at 18:17, Will Deacon <will@kernel.org> wrote:
>
> Hi Naresh,
>
> This report is quite hard to follow, so just some minor comments which
> you can hopefully take on board to improve things in future:
>
> On Mon, Jul 01, 2024 at 05:28:29PM +0530, Naresh Kamboju wrote:
> > The mainline kernel v6.10-rc6 boot failed across all arm64 devices and
> > qemu-arm64 and no crash log found (earlycon) did not help.
> >
> > But the defconfig builds boot PASS.
> >
> > The boot problem is with defconfig + Extra Kconfigs and builds links
> > provided in the bottom of this email.
>
> If I go to the bottom of the email, I see this:
>
> > Links:
> > -----
> >  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2idWrbdtwMqpD9wx7IPRGJ7Dsx3/
> >  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2idWrYDposdlRsS4jwF916a0qGE/
> >  - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.10-rc6/testrun/24473346/suite/boot/test/gcc-13-lkftconfig-libgpiod/history/
> >  - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.10-rc6/testrun/24473903/suite/boot/test/gcc-13-lkftconfig-rcutorture/history/
>
> but these are just random links without any context. The first two appear
> to be kernel build artifacts, but I can't tell:
>
>   - Are both "good" or "bad"?

Both are bad. which failed to boot from these build artifacts.
Which is the location of storage of Build artifacts and build logs,
Image, Vmlinux.

>   - What is the difference between them?
 one build is pointing to Rcu Torture test build,
  - CONFIG_RCU_TORTURE_TEST=m ++Kconfigs

other one is pointing to libgpiod build,
  - CONFIG_GPIOLIB=y ++Kconfigs

>
> If I look at the first of the last two links, click through to the
> "qemu-arm64" target and follow the "job_url" link, then I end up at:
>
>   https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2idWuAb51mcz7lO1BAj8Aw0BrNY
>
> which has some empty logs and something from "TuxRun" which says:
>
>   {"error": "File not found"}

Due to missing boot log this file is empty.

>
> It's very hard to know what to do with this :/


Sorry for the trouble.
I will add more detailed information next to each link in my next report.

>
> Will

- Naresh
