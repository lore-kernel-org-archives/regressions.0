Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA93914E9
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941142; cv=pass; b=kKkdC7tGbbYavAFo2Oue6XVn7By+R+/pf7rkPUoi6M1OFATz5xEfwPgLYkMvcZFy8yzdkEVp3SR4RXVG1vVbzaCEfLYS6BAvYV+u+fBo9SiJopM/xuujbcN4l3zs3o0DJl//ayU13oiIpt7xESVFcwaqa6fT8P41PT3+CEQhO5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941142; c=relaxed/simple;
	bh=pU4LloQCWvu6t6M/Xne7xPMuYqsv0Zx3JiyPEP1RHBo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Zl3/4g41g/bpxs0hBtHfg5r7Dooxd1f9/FE/kGx2zblbMQ/iAu7FeIWKa8lZRj2hLV2tc2qlEhVESXfnvcOQCPJrdGFoyNWHBa3dqvjXfoQtbihzu+MszyIyfXgvi/ddT+9w8/sBffEm2akGTkCMWYLkykPzJ5qZnFLlz9h1arw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5jaTF1v; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5jaTF1v"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so1550152a12.2
        for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 11:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787941139; cv=none;
        d=google.com; s=arc-20260327;
        b=pJcefy/+Ob1gtDOxTh76owg6hXtppISOOX4jrjaDBetTJU/dwcUw4GvYtfCUhRehC+
         YuGC0LkAzneoDDmojiHfUT39Jq4h1mzkP8bl2dVuQ6WqQCITTWrLRcGpYNueh4zazBj5
         xLtdJFcVNyusmlvOLnJv5XSf5zYRb0VoxCkUF+ovcQpZ0hl+lRc9x1tX3SGO/nrSZTwX
         uRlnlyDJXkXznz8CxnQo7XlDYJk6Uu2G0Nd2+89PPuJg8FEWdbbeCG4RZND06HprVK0B
         i+Neda6go7jhrWhQsvcs/bmjawJ8W+5kRM+UFzGXqRazgC2paKiHtbiHRLfknE86J7P+
         FTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pU4LloQCWvu6t6M/Xne7xPMuYqsv0Zx3JiyPEP1RHBo=;
        fh=Hi51YWuPkGPl+o+QQFCkEuCgNPef+ggQN7GkeY6Y8Uo=;
        b=Wsedl4GyDENJVbu1PP9F0bP4aBZ2K91HSJJygYh4RGnoOpc6vUYNcEutucPRaarbvQ
         +3/vjiN7jBJWlJXngkYdVlxuAnNnGElFQ1S2VdIcNQvjKhR7UtPLQyO4H+XUTRiSG7n4
         BVsTVz7HvGvUevm+1AGmmilTbmUInH4c4rPrlGNdy5N4pFpUchJLMVE/Ut5bIXgkp9Bl
         YWVs7al1BVR3j9Uy/f3wEXnwx/LHVHkqasJekw6WahiG+H0ictFzrDtOC/9JpzYRPYTL
         1b8a9wwOutuQ8+GWYMe8PPD0TwgGiZmlWBqelPO5zivkL4lcv4OpyHBrsB7nKNrsdGA5
         fJyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787941139; x=1788545939; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pU4LloQCWvu6t6M/Xne7xPMuYqsv0Zx3JiyPEP1RHBo=;
        b=W5jaTF1vER91BGCIt3nluQxNvMVsIoc7yquf/T3IRDC4VVxEZSBiG0g4UaTKR/iKct
         BslUivhtl+t28vpiWKF8Lk2uYF/xAiBqBkeOjPOGT47FRWRoBKnDd7ZwIl6fOIaRaD0o
         kKbJjePtXuRSmyoFXoBk+fJ7FiQSyukDyh9je6wgHpbniG9FsZ37P9QHHV9/yt/y5lb3
         d5QIUV3KiFy7X8d52X+LcCZh04OF721MwcXMRcDaJitl5qeutGZxkb7OeqeCCw0ImjwH
         8gsJn4fX3f82CjBnReb2U55qA1vCEbTugr4Qd7eSm6eA9eNfJ2q/1fj6EjsKGyxjKxK5
         TpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941139; x=1788545939;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU4LloQCWvu6t6M/Xne7xPMuYqsv0Zx3JiyPEP1RHBo=;
        b=WG2zyikMJSJjjuVQiFO4zuY3XrK4IQU6eJPfAjF6kiEnvhFTQ6UdCmXcgjZhUGQiis
         zUVVVMogTdJXc4KUONnOMGV8P4HSH+L87+YXbksJOLlLCPUgU7G3hGNk0sZYHSKeLesC
         HiAnz2P1fqQ3KAAYJ1sf/qfz69UKweKQ3ODBYML/eyiPDoChgR3naJjegiznIVrvuEeK
         SBIJa0wnXnIAi2ayUtxkX8Rr2Cu1/Tx38wSKrmJlILWLTMIFBrIQre8296KG7uAH8BL3
         fF8zUs62G9BqZ6Vg1DZbaLKKvVX3+wV/nTVwv3yJmFDTRVz5z7pOeB/dOf1DQtnYivLw
         shCw==
X-Gm-Message-State: AFuF++kpTk8HcJNJCqtrLK+qbBNVDdCtNxTMv5TAsgXTAcb2SW6th1fG
	d3Pv4a0TZ7+bDb+dyXCE0+zTqZJvDqwlzLHrHgXzs/BeKrfOVNfJ1yL2kOwEIinIx67HfhLxu+P
	bnSN49bqf0yKP8gt5B317/tm3pMicnmnPpFuosBA=
X-Gm-Gg: AR+sD10h4qke6Z2WtBj55u5CA6Gx0Fvb9WERByNFyRALj0s8fynS8xWSQdPLUBTohPs
	hrzcvgbVVBndgHmyoLqLxjwT9kNjNalHWPUsls9hxss8izA/LiyiY4zUcFs4M88L/vDMveh+zEk
	FO8bLqa98g/7NW5dYZPMDT7G55QwUOin+Uv5r6HW+SGNOEwoFG9OSdZa50Tk+XZyGPS9pjf+iDL
	+VYrMJUJQaz07eNYkmqcR88nVBrVUM+enDT1rjQ19XgciMvdHkQFC/CrZXnheeMBJdRRPmrXII+
	xrWeXmDU+2HFha4+p7UK2ud1ZU8tUKH0Bhn/7HJCaRJDm4jxSj2ShMA=
X-Received: by 2002:a05:6402:a0c7:b0:6a1:c4f:3153 with SMTP id
 4fb4d7f45d1cf-6a60d2ec4ffmr6520007a12.2.1787941138591; Fri, 28 Aug 2026
 11:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: David Stefan <stefan.davidalexander11@gmail.com>
Date: Fri, 28 Aug 2026 21:18:44 +0300
X-Gm-Features: AcwNN1WJw4eyxGx0v86Bpqk4ndu_8q3QZjKS-nqasEhPXsxWu5l-4fgahpNzIIw
Message-ID: <CAABU8jnNMoyLBCmaxs+iC8WgZiUH4=yFSiHepNpqPiBQfA56Zg@mail.gmail.com>
Subject: [REGRESSION]
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fedora 44 Everything (netinstaller) with kernel
7.1.10-200.fc44.x86_64 running on an Intel Core Ultra X7 358H with
32GB LPDDR5 system RAM, a kernel panic can be experienced during
certain gaming workloads. Haven't been able to create a very detailed
reproduction method, but roughly, it occurs after about 30 minutes,
specifically in Cyberpunk 2077. At this time, the iGPU (Arc B390) is
at 100% utilization (checked with nvtop utility), the game freezes
with the audio looping for a second before the kernel panic screen
appearing for a short moment, then the system reboots. This issue
seems to occurs sooner at higher resolution settings (4k, as opposed
to 1080p in the original occurrence), however, the kernel panic screen
can no longer be specifically identified, otherwise the crash behaves
the same (freeze, looping audio, reboot)

I have not been able to reproduce this on the previous kernel, being
7.1.9-200.fc44.x86_64, after individual 3 tests.

I have attempted to use kdump-utils, but so far, it does not seem to
have been triggered to dump the vmcore.
