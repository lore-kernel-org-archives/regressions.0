Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6A61683
	for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708425064; cv=none; b=lOUk9RwMNLTWZaTXO9I50GZ/xUhKeTuwoK3Uvk35fzxDMnnyyt77g4tn5MtQ8rlVZbeJYoCBDV8KqbVlmLu7jOXV7NdSzJ3xdIfXLZsrUrU5oO0Mec0kpCofBUggQt8NdYq/Q+8NwrIGXsgiJvbpmYHBQ9nB6TeOuBoHIx6OPMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708425064; c=relaxed/simple;
	bh=4ka26MKTb2gAfNP6PWHyqiItjIFpe0PWywv9rC9J+GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIlFm9uSIe2SqSeGDxw0YEpgfo801d9jQn7thCwNB05MGbDI3CVNfJAp4vo6jNDfruOudyxybwV+QGiNc0ISvWlt8mPFiUoegSpPO+cA9/FEeGuH5yVdf7zRn3YwQjU+fmSItn/aEPytgllKGEq0rwo2/43gdQM/pMhalDLGbfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Je8MNqIt; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Je8MNqIt"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4cfa1b3c3a2so141686e0c.0
        for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 02:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708425061; x=1709029861; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HIp91kw+zH2bWJFkkeSlk/Ch+KTOQUCDIw5fmR7h+Tc=;
        b=Je8MNqItsqn2Hgq3Dli7e/0mmfJq3e7BAMYLlc9dEobcdXwykhOFtDP4JCaYzj+ZoG
         XiQn5qZgsP8KPixEH5MsV1z/UpmSdczJDmV/Xw/EYKJbtjPuFJ8bb7/LY/Ua42QBLKD5
         1qzZdhA4vQkbqp4WBOaVMXloG5YoBOh6PEMw8069wmxDY5gt2UFiGg0pm0xGnskj9WQY
         r1xTAoZyoL6phWynt+cUEDw3dJbytvwc0mLm5XlGJ5l8E3qv+Pa3LyqfnXIlt5dnlK1W
         909oABjwXrfD31nqSgkXyiIYN4OuDEPH6XgKJDDPYW6S1ClAKpHNPN07G12V8YqAfP97
         6AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708425061; x=1709029861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIp91kw+zH2bWJFkkeSlk/Ch+KTOQUCDIw5fmR7h+Tc=;
        b=XyuC3u0giQjkLLeBp06AA4FAtA/b+yMO72HjbZftcvupW4HDl50hpC79XHwjjheD3s
         YsLZOJkgy3/y+Ck66LpywE4k5RvMAKqGxE3XAkxM64ZtncpYr6L7RxLq5E1u8QiaUwF5
         WQrxrtjxWAPo0TEU4EyHhRdl3HL86oFGb2inbavJS0/ls/y17M/PGi1gLLCc1w6S+LCT
         t8aj0cmXCp0i44xyYghNQtvH0QkUU3aZ6NkomG7b8ly32CKys45aw0suXYfnNyT91OMw
         Usp79hdFh4p3TbPhw1LRixn0xzRF0sBoqRCyld5Zgx7D5rPySM3h/R3e6pwY1d0wo4Gf
         KWkg==
X-Forwarded-Encrypted: i=1; AJvYcCVluCUsOEZ4liY9+qZRFmaleSgTjnmwbFIfHO4Zj1svK/qQPfwrE0xm8dUjsba603pArlE3zuFSu0J9oOQqWjEsc3n4Xv9mghQfnhI=
X-Gm-Message-State: AOJu0YzSkYtxec8nJStYQGi5zBnTwTWCiXWfffVJf0IU8s4NC53rqv5v
	1ZruWszqiE29xdsWN1Gjhz9FqzxIqHrW/oH4wpYF7aHkyHav0rnUUllT2fE7xCWQBoW/U1ocuRq
	nCA5cJ3AHsOjJhgkVPGpk51uvOUgl5qGLPCBpgA==
X-Google-Smtp-Source: AGHT+IGysc0UmXmPnthjzbU7YPIZ9HektmfceOwdP9++ToUAMtvh7ubmq2V4CELGPXIvh6F4I8e8i12+OzE29ejs2dY=
X-Received: by 2002:a1f:6603:0:b0:4c9:6628:be66 with SMTP id
 a3-20020a1f6603000000b004c96628be66mr4749965vkc.5.1708425061512; Tue, 20 Feb
 2024 02:31:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYugYiLd7MDn3wCxK+x5Td9WO-VUX2OvOtTN7D1d4GHCfg@mail.gmail.com>
 <86edd84wer.wl-maz@kernel.org> <86cyss4rl7.wl-maz@kernel.org>
 <a7d8e529-9a44-3f88-50ef-d87b80515c36@huawei.com> <86a5nw4gp3.wl-maz@kernel.org>
In-Reply-To: <86a5nw4gp3.wl-maz@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 20 Feb 2024 16:00:50 +0530
Message-ID: <CA+G9fYtWqf1h3w1nkjJGXjYis7Zx5pNxN=EvmfFpMxgktW70Xw@mail.gmail.com>
Subject: Re: next-20240219: arm64: boot failed - gic_of_init
To: Marc Zyngier <maz@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Feb 2024 at 20:57, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 19 Feb 2024 14:46:46 +0000,
> Zenghui Yu <yuzenghui@huawei.com> wrote:
> >
> > On 2024/2/19 19:32, Marc Zyngier wrote:
> > > For what it is worth, I've just tested both defconfig and my own
> > > configuration with both 4k (kvmtool, QEMU+KVM and on SynQuacer) and
> > > 16k (kvmtool), without any obvious problem.
> >
> > I had a quick test on top of next-20240219 with defconfig.  I can
> > reproduce it with QEMU parameter '-cpu max -accel tcg', but things are
> > fine with '-cpu max,lpa2=off -accel tcg'.
> >
> > Bisection shows that the problem happens when we start putting the
> > latest arm64 and kvmarm changes together.  The following hack fixes the
> > problem for me (but I **only** write it for kernel built with defconfig
> > with ARM64_4K_PAGES=y atm).
> >
> > I can investigate it further tomorrow (as it's too late now ;-) ).  Or
> > maybe Marc or Catalin can help fix it with a proper approach.
> >
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 4f7662008ede..babdc3f4721b 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2798,6 +2798,7 @@ static const struct arm64_cpu_capabilities
> > arm64_features[] = {
> > |             .sign = FTR_SIGNED,
> > |             .field_pos = ID_AA64MMFR0_EL1_TGRAN4_SHIFT,
> > |             .min_field_value = ID_AA64MMFR0_EL1_TGRAN4_52_BIT,
> > |+            .max_field_value = BIT(ID_AA64MMFR0_EL1_TGRAN4_WIDTH - 1) - 1,
> > | #else
> > |             .sign = FTR_UNSIGNED,
> > |             .field_pos = ID_AA64MMFR0_EL1_TGRAN16_SHIFT,
>
> I've posted my take on this at [1], which hopefully matches what you
> were aiming at.

This patch [1] applied on Linux next-20240219 and tested and the boot
test passed.
I have validated today's Linux next-20240220 and the boot test passed.

> Thanks,
>
>         M.
>
> [1] https://lore.kernel.org/all/86bk8c4gyh.wl-maz@kernel.org/

- Naresh
