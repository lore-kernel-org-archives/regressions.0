Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B829406
	for <regressions@lists.linux.dev>; Sun, 17 Nov 2024 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731825143; cv=none; b=Jprw0GYvZrJLTV/KiNsUG19GmC6raKR1HQnVme77UlKvkb7STPC5Gpm3oA0VhimmbiT9mYlSAlr28k+Wzf4484tYnkIuk91z14zPGWEH3r2PwDotNhONqmuJMZgIVk0ycqVDzDKofm+P3SMbNjZTUru5U+Qf6cjAj7gejVtnZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731825143; c=relaxed/simple;
	bh=js5ER6/mUai+uomy9jo/Q+NnireaZP5PHNtj0eg7FsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6XTgswyyRfr871wMDuoSdfuwZwPFT88SPosULE7QfWNQNxeFZ4gjgAUQFj6QFsi7I4gkGOquu3OOQ1LT/LM+R23Jg4pEjNKBGa2HPq0yrsQOzJ4eWzjrgiMFfVoLF4zbRHRYBjM7Q3Nc52dHhhmwV8DdLR9m5RPIPHzhPyCoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+tW9IbN; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+tW9IbN"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-50da1fceeacso894676e0c.1
        for <regressions@lists.linux.dev>; Sat, 16 Nov 2024 22:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731825140; x=1732429940; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+7qSc1fVHmPer1xJUptlyE/yxio3bMTRubjYEAtyecg=;
        b=r+tW9IbNJ+b7Vify/PDC5slrRoPKE2GNNpOIEirWQX48CkfDt/8xleuIeZt8frxKyF
         JH9CT6JE8F1PuhLBnPe/JHjedGzhWdSoIj2TPeVvyIyWwP15IrfAmhaxRv/HjA6mZjPw
         A5RgAdYeX3HAOs2xlKSb08dWqADCwYuWMD7e8GUDzYpvNvs8Ez/WFg2306dRv+Daynl2
         fzwZW44hIaQTY9fL2/bvwVUF/FjzQa3/m4SpyPD/nAQQJcpeCg1KKxTxscIbgp5jIeLO
         x+VAhArbCn7+bN3++ucBjFH/ALr/YC5rxds3XnowewAMUWQtH10EnOpVpYSLdMgOpfyB
         ZOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731825140; x=1732429940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7qSc1fVHmPer1xJUptlyE/yxio3bMTRubjYEAtyecg=;
        b=DRZ1v1ifgP49ryt/09lBqw/Fq+Ok3LLnU02FIrE+7Lnjm+P2WmBzZKJWTiRZhSeo5f
         vq/km8phKgkDOAPYM/wEBBd2ay4nlVRP73GWC/v9lgm4r+bEUfVOmY+InT1gQyYeAQqV
         MxFv6QFA1qXIhZIURSTSzsBxGVzJiui7HkZpkeUtv+0pn7g4BPGd/w4QhKhpivOGO9Dz
         YTLevKQ4OeBxyu98ZcFVYS7605HG1uknzySKngiJ+a8F+4mia+QwITYzOHR3WrK8wcuy
         DzyKrDRyfvfBo1inhluwar1e5Bra39DExIurW8S1q966PugLXCZOBFpaXbjcP+3wIjrL
         x01A==
X-Forwarded-Encrypted: i=1; AJvYcCWE1tpGdgdhuiwJC1Fc4MPcuscrW/pVg1LuouM9QcrP8Y39MAcSV6KJ6EaaGCo5gQAzyPc1Ya+uwejC+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyluSoYo192Rw7pqwyzk6KN/WOGbZSJS7Xfo4VWUS1te9eAz9e1
	rl6Ooda+oiF7FTO6CGheI4JzOBRh/htF/0Ne8tf/o/0acOQyBwZaPe0aCZNZmW7x7PnYz9UhWaa
	gaDN2Dc3ZcQ59YOj6VZNhHUDYHJvO5w/s6zotsg==
X-Google-Smtp-Source: AGHT+IGRh8YruUGu07jFRPzp370nbfvg/Y5tJl8pnw3Rt1hrLahShOnGJFL+33z9fqviT6zuUFmq+IrxpExykzDX1MM=
X-Received: by 2002:a05:6102:e08:b0:4ad:5beb:4048 with SMTP id
 ada2fe7eead31-4ad62d5a317mr7754717137.24.1731825140429; Sat, 16 Nov 2024
 22:32:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs9R7DwZVkA_MRaqWwrfuuvZ-3wMcYuk3oHA0prN3bKRA@mail.gmail.com>
In-Reply-To: <CA+G9fYs9R7DwZVkA_MRaqWwrfuuvZ-3wMcYuk3oHA0prN3bKRA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 17 Nov 2024 12:02:07 +0530
Message-ID: <CA+G9fYtTgghGirzqYmRFtxjgr_38Tt4oLvcyjEinqh41UVRqnA@mail.gmail.com>
Subject: Re: arm64: __kmem_cache_create_args(ext4_groupinfo_4k) failed with
 error -22 - Boot failed
To: open list <linux-kernel@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, "Theodore Ts'o" <tytso@mit.edu>, Jan Kara <jack@suse.cz>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Nov 2024 at 22:51, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The qemu-arm64, qemu-armv7 and qemu-riscv boot failed on Sasha Linus-next tree
> due to ext4 crash. Please find more details below
>
> First seen on commit sha id c12cd257292c0c29463aa305967e64fc31a514d8.
> Good: 7ff71d62bdc4828b0917c97eb6caebe5f4c07220
> Bad:  d11b462aa01e0ffd5f8cc81bd5d2cfe4e48c8fbd
>
> qemu-arm64:
>  * boot/gcc-13-lkftconfig
>  * boot/clang-nightly-lkftconfig
>  * boot/gcc-13-lkftconfig-perf
>
> qemu-armv7:
>  * boot/gcc-13-lkftconfig
>  * boot/clang-19-lkftconfig
>
> qemu-riscv64:
>  * boot/clang-19-lkftconfig
>  * boot/gcc-13-lkftconfig

The reported regressions have been fixed in latest commits on the
sashal/linus-next.git tree.

- Naresh
