Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBAF2D8DC4
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355183; cv=none; b=Bz48jyK8EgvIm8g2l7QItcCZG3Bx1BxUXyY02HUwfcgLXwa8nXkNuOaP8aeHdG73ScC6LWWwzqPZMbL5VYsWB4Hjqjtazpdq5c95VJwEiu3ZLl+8rPyGI57+q8WV2tCuGLwPRmHYCMlfjGa8COMTv6OMYmSPS2K1qOXo4q89y7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355183; c=relaxed/simple;
	bh=rU2mxPk6LPZWtjh30o07aLWgSyr6XmHoVJEsBWQ7/nU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bNxTS8OVU5WGuUdPcqdA/H9EI3jFQSk40iFHsYYj6I/3Sb6IP1eiGvi0h4BLTQMZFnhzR4TFyrstIA9s6Yq2B5MWYFW4VCrCBKPzJwTgMJASfn8HUurPCAHFL2XzfZw4+IuvMCOv8cNv22thQOSrySy00Vy+K6+8WhSUypnk3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=CgQjvaxW; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="CgQjvaxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789355178; x=1789614378;
	bh=rU2mxPk6LPZWtjh30o07aLWgSyr6XmHoVJEsBWQ7/nU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CgQjvaxW2Lh1GmYZWyWczDBjvMlXSEYdp2oflfW9MIrX8bmMsHOsnX9iXhI/5GDEB
	 Gw/rx4jMpvGGaA/SczjGpVlm1Idb7Wj04ixANzqlOqIfW+iVBhLQOtuXNmN/ZhQV9Y
	 HVXD2UEEdUuBHuhcK4yw/boRhQTV/dpCItYpy2woUd4rXKR9XiR85uqzqFeroeykY+
	 NH/xFTEqSdQBvHRpH1mVAcZ7nrcYBJJNZYyC31teyF7VdcfOvyFkQ9lYLNM5m9KTi6
	 rWZ65SWDsij2kWF5CgTUKGBJkFR687qtoD0WcT9PiY3jqmu7GnQl6+T+ktplA/LiB9
	 GOxFtN5fy/lYA==
Date: Mon, 14 Sep 2026 03:06:15 +0000
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: jackpilot <jackpilot27@protonmail.com>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: [REGRESSION] NVIDIA dGPU never enters D3cold since Linux 7.3 merge window
Message-ID: <uz7NywYQwAzrOgqWjIeyjuTn3PalBrqAsBKcD81tQNJCCFw2j5yG6zQ9cH_PiHiUBOxOoms_MPh6g9FmBmsD80RVXLf8zSQZ4QXP24Z9dv4=@protonmail.com>
Feedback-ID: 150257845:user:proton
X-Pm-Message-ID: ceb641eae7eaacc506f24b0bfcc8a09ca5f22dbf
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Since upgrading past 7.2.4, my NVIDIA dGPU no longer entersD3cold/runtime s=
uspend and stays permanently active. Confirmed
regression, not present on 7.2.4, present on both 7.3-rc1 and
7.3-rc2.

Hardware: ASUS ROG Zephyrus G16 (GU605MI), Intel Core Ultra 9
185H (Meteor Lake), NVIDIA RTX 4070 Max-Q / AD106M, nvidia-open
615.71.09 driver (unchanged across all tested kernels).

Last known good: 7.2.4
First known bad: =C2=A07.3-rc1

Evidence (/proc/driver/nvidia/gpus/0000:01:00.0/power):
=C2=A0 7.2.4: =C2=A0 =C2=A0Runtime D3 status: Enabled (fine-grained)
=C2=A0 7.3-rc1: =C2=A0Runtime D3 status: Not supported
=C2=A0 7.3-rc2: =C2=A0Runtime D3 status: Not supported

Same output from /sys/bus/pci/devices/0000:01:00.0/power/
runtime_status, power/control, power_state confirms the device
sits at active/auto/D0 permanently on the broken kernels, and
suspended/auto/D3cold on the working one. No processes hold
/dev/nvidia* open in the broken state, ruling out a userspace
handle as the cause.

I haven't been able to bisect further since the regression is
already present at rc1, meaning the change is somewhere in the
7.3 merge window. While investigating I came across an in-progress
ACPI series that touches related territory (PCI devices getting
stuck referencing power resources during early enumeration):
https://lore.kernel.org/linux-acpi/2295263.irdbgypaU6@rafael.j.wysocki/
but I want to be clear I haven't confirmed this is the same
mechanism, I checked dmesg for the specific _DEP/INT3472
trigger it describes and found no matches, so it may well be
unrelated. Mentioning it only in case it's a useful lead.

Note: tested on CachyOS's cachyos-rc kernel build (patches:
https://github.com/CachyOS/linux-cachyos), not vanilla. Happy
to test a vanilla build or apply patches if that would help
narrow this down.

