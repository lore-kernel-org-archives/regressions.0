Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7382954279
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 06:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725864849; cv=none; b=lbiwTkZjRUWHKSw7hELva6eapzUoSHY1VK3J6zjLjXhlOWYhw9L3Cqf9MOY1V8/0UZpbtDK6kQAySkhoJQES2v34gO7LtuJzF6JJ11uf2Vvj+EKBD2lmOo8ettzqW2JzpSqiax+/zgcTB2uV+IRYjsfmqU7OEVook5t9ZNZoZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725864849; c=relaxed/simple;
	bh=s90mMIl9Yk0dS3ZxwgoGrwtmHEwr0osOFdbPy6fBLDg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bdDhRRdV09lnwII1WXs0xMNu/5PoMoYj/eXSZttori9AQfEpl0HPv1GbLqKSySJ8SNzZC7jmMZ5e01g6TwORQQDfhrPYKfc07gwzct9DQA/3ucNhJ8F25mNFWazYaeRs//GBo+cJ+7BYjfrgpBt/veWGqoOZ9oeRgv6pd4EgYoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzb4DQTf; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzb4DQTf"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6cdae28014dso28655707b3.1
        for <regressions@lists.linux.dev>; Sun, 08 Sep 2024 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725864847; x=1726469647; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q7d8zwumBa2mhTup4zQYqTmBFbEzejGeaSSz2DQo8ts=;
        b=dzb4DQTfizLW4BeKJmN760CRVTMR56lWKajGSPgmshC7MeXMOSQkGDtlwFHd2WMdTc
         u6hXaWG+G8vIMwg6VlPU5E9UGOmkqXB/lcjh/SXwapygSlxlaNsm4dj/SZImGKCPlCWC
         5atpHqg89VANjblsIZdJwve+aXQf9yA185ZleDapDjWPatrAwT3LIMaBChIYnsAZlPP1
         gyetKvze+d8QGZii3l7R1YBapBCoc8VVXQ3re2GMW4jTsmuyDbyOV4QNut6diNHdT30j
         lsrNcNDVbm26uTJIJieau7J2Pj2mV2BoVRA2x4qDoGg0hRbjF5/AFKltATo2xnDiimc1
         Hhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725864847; x=1726469647;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7d8zwumBa2mhTup4zQYqTmBFbEzejGeaSSz2DQo8ts=;
        b=NV7qRLILFzl/ifgA8b6QIi+V5e6PxEwxmAgSTcfnNBaynoEc2jvHZTrJZ6GtN4Zsfe
         9lgZkY+3YUkVEbuVQjlIys5oIEcqPiI7Y6iAI02yrfETGeCzmcmEYpersrr8HveIxDBv
         UmxOHZ1MXFAAvoGNGQq0daC9GOhFdsJdEyH+S2iM50NRbz6WBbDeEXtZvStn8IAog+7F
         t/EHKN3JBXY6VhoZaHfmJ915zUN5LBCjUWcZelF3ATCGvXLXO7LHMYPQCtBT9WBYRjm8
         nz6+F00c7meL0IxPQ11eRsNL/bJAYGWdK0G+wu2V8s8Z81o76dN6LzsURnld5JNZIjLI
         YsoA==
X-Gm-Message-State: AOJu0YxVDatIrkxRjd52GK2sG/pVq+68tTm0eyCsAUCQzZCXVH2hCbQV
	VLaOw5t1RpyVWet8T1AbA2NZ/dJTUImrT9TmFX9qho8UVpbJXVY7zBe0EZXASaOV0+H0+DxIZMX
	4n/pOAtUX0QFyggZpkZFbPTsvBVnA8vaEzrM=
X-Google-Smtp-Source: AGHT+IGf+k1Qbf5QZG88Dg+4QfNHq6ywW4JlKCO4pQ/VZyLmq0NSpIL5vgjIjpH3e3gxkgq+6y9vc0izdS8MD1vtfww=
X-Received: by 2002:a05:690c:28b:b0:6d6:a5b7:3ff with SMTP id
 00721157ae682-6db26016c10mr136267497b3.14.1725864847299; Sun, 08 Sep 2024
 23:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Hugues Bruant <hugues.bruant@gmail.com>
Date: Sun, 8 Sep 2024 23:53:56 -0700
Message-ID: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
Subject: [REGRESSION] soft lockup on boot starting with kernel 6.10 / commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I have discovered a 100% reliable soft lockup on boot on my laptop:
Purism Librem 14, Intel Core i7-10710U, 48Gb RAM, Samsung Evo Plus 970
SSD, CoreBoot BIOS, grub bootloader, Arch Linux.

The last working release is kernel 6.9.10, every release from 6.10
onwards reliably exhibit the issue, which, based on journalctl logs,
seems to be triggered somewhere in systemd-udev:
https://gitlab.archlinux.org/-/project/42594/uploads/04583baf22189a0a8bb2f8773096e013/lockup.log

Bisect points to commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5

At a glance, I see two potentially problematic changes in this diff.
Specifically, in the refactoring to move the call to rdt_ctrl_update
inside the loop that walks over r->domains :

  1. the change from on_each_cpu_mask to smp_call_function_any means
that preemption is no longer disabled around the call to
rdt_ctrl_update, which could plausibly be a problem

  2. there's now a race condition on the msr_params struct: afaict
there's no write barrier, so if the call to rdt_ctrl_update is
executed on a different CPU, it could plausibly read an outdated value
of the dom field, which prior to this series of patches wasn't passed
as an explicit parameter, but derived inside rdt_ctrl_update

For initial report to Arch Linux bugtracker and bisect log see:
https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/74

Best
Hugues
