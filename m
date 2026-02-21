Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3113090FD
	for <regressions@lists.linux.dev>; Sat, 21 Feb 2026 01:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771637963; cv=none; b=VEOUGgjBP/qmObKd9niIYAwewKfboQm7I0N4AguD0//8ugWc+mYXu0pLa36Mx1OmUDc96RS8RKtreIRJ/9ooBzFelX2CrL5D3QQw8yVglutEw+DJBDjpbqTWBcd72YO03QOd1o/Z0glNySIiA21ORbg1RmFVhwt4Msf5ZECDyUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771637963; c=relaxed/simple;
	bh=VxhPVUyoO3hiTWkFoFkhmqlDhO5q4VD+zDs9agEE6iI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=gJvfVkTVzXRHDTv6sJwx8v+Xy+UPM6S2bWvx0mPJlPYxbPRRd8jLWSj9qiBBUpV1JUHPE0oFPCdu6+7h3O2kD5/zazOvNQYUBik+C2DAElTxW3Pr+hlY4GHykWYfCQnzUcYbISXddvtrDKxAjzFGcGsoOnZ+UWfPRN4MCW4/plM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io+X6V9e; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io+X6V9e"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38709888abbso20955921fa.1
        for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 17:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771637960; x=1772242760; darn=lists.linux.dev;
        h=in-reply-to:references:mime-version:content-transfer-encoding:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxhPVUyoO3hiTWkFoFkhmqlDhO5q4VD+zDs9agEE6iI=;
        b=Io+X6V9eii3PhNXgbxuVh1J8XOxTK1i5YQ5V9bceh3Ar609xpAOrytj3N176HV2W6F
         u/eVJCqi6duiZ/7xGM5RHZagA+cJqW5sLPvsoRjDjaaeICbekv52jDguQmWmBZdVdBUD
         TEmRgHf/wsRgNdWP/tzeXmRsqSi0n54OUhnDaYvGEB+3hlgt78rrjdFCooPf8skDElM0
         qRjRDgNHDvNTuO+WDqHTmBb8+RRT1doa7D12Qjtl82U7hyk1DQt9S75lckd8eozdTapJ
         Expukv1WNvijJ2ObRayN+qNKUq9gATFQEysH6EULZMwsQmr3xf3INsF8ceCxOUVlSH8C
         PGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771637960; x=1772242760;
        h=in-reply-to:references:mime-version:content-transfer-encoding:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxhPVUyoO3hiTWkFoFkhmqlDhO5q4VD+zDs9agEE6iI=;
        b=f3fQfr/DUQKV7KG/7I6tQdE0A5mUmGLzx74J1hv15eusTwPQ7bVlNYSJMTA5lISxpN
         aPGMi3+B4subbQ9j/JaPJbGMmSUIb7NaTlzQq/PBBDwRqt84h9GxvRNOQ2zttPYgGpCm
         pMAWtAprgFrCRvp5ae57087XlyQVsdcpkb8rdM+sgaovW2+225I9FrEQrosU99o/lSI4
         /cD2pL2wPQwXFagLL+XajyvBuFCChU4ZiBrrIvbD89ktdpZNMReeY5UUIHOOl/z7oUe8
         LDmiUHUKt3oXEg9eXsqu2NDmfQa0fIjWiU3b7G/Kga1S54K+ckbNZmyB8uQU2IInUIcb
         5mDw==
X-Forwarded-Encrypted: i=1; AJvYcCWV4RN9ENG/coSRigKMZNxMDPe4sKb6oXRPKcLsqwjfTWpY8t0bhIM4e4dwyP3hl8jQd3vbNiR27Qp/KA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz72xcy9L242Z+GvkokO0ao/o7646cBnJfANVACLvcFsn/D7i7p
	0MmJ4Iq5QPMJaE5AZweYlLFO9OqiRtp6URtVnngCJoAVHyRyxlVpxKM=
X-Gm-Gg: AZuq6aLBHArrehYhUpfW6jH9HrQ2mfLQXSzLgzY8V4f1Th8u1nzZz2xz++SRBZECqe8
	nRiYnsQGHBzD9qJ8imhfgbQvNHo1D+E65ZLtdNMPvfNnPeygmomJpUNLz62UaVRU7UG+vxnhWDR
	FMdGI5b6ZVTZ7AqpHU1HrzgmGQTm3APBlLXIr48IXJEXL6nPavO69IzBrBmSMZxQkzf12su/kj3
	XpdIxyP1pM8rjnEB3HUPS+QxRdgloudpxVueUUrOGpbnUKisf5CF4cOVjAxE/MLFbyDpMpznUWD
	uMgRhIN84R1iSEPyjBGMDxjBwOM8eqKIE+it8kjZKgIZpfuhBJkA21Q+bk/Zp1ahxGeIWFTLinf
	PfZGe8hAwsKvvneA/ZswM2/PHoDJQm4ENoyIvl/5+RBjw//jx4ahiF4J3HM5kdr/w5v4aWM1WEO
	zuYNLvDcMU
X-Received: by 2002:a05:651c:31dc:b0:386:8f97:d0b4 with SMTP id 38308e7fff4ca-389a5e4cf70mr5274401fa.33.1771637959898;
        Fri, 20 Feb 2026 17:39:19 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78d2326sm1752321fa.15.2026.02.20.17.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 17:39:19 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 04:39:18 +0300
Message-Id: <DGK98QFUDRR2.1RCLDXI8XRBFR@gmail.com>
To: "Melissa Wen" <mwen@igalia.com>, "Ivan Sergeev"
 <ivan8215145640@gmail.com>, "Mario Limonciello" <superm1@kernel.org>,
 <amd-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mario.limonciello@amd.com>, <alex.hung@amd.com>, <daniel.wheeler@amd.com>,
 <rodrigo.siqueira@amd.com>, <alexander.deucher@amd.com>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <christian.koenig@amd.com>,
 <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
 <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
 <DGJH30US2XMK.S2HOHR14LIW0@gmail.com>
 <bed447c7-07a3-46a8-9bcf-da352810883b@igalia.com>
In-Reply-To: <bed447c7-07a3-46a8-9bcf-da352810883b@igalia.com>

On Sat Feb 21, 2026 at 1:47 AM MSK, Melissa Wen wrote:
> Can you check if the attached patch resolves the issue?

The patch does resolve the issue!

There was a problem with my particular setup caused by the fact that my
greeter didn't have the VRR feature enabled, which made the desktop
environment take longer to start and the following error messages were
printed to the kernel log:

amdgpu 0000:2d:00.0: amdgpu: SMU: I'm not done with your previous command: =
SMN_C2PMSG_66:0x00000028 SMN_C2PMSG_82:0x00000000
amdgpu 0000:2d:00.0: amdgpu: Failed to enable gfxoff!
amdgpu 0000:2d:00.0: amdgpu: SMU: I'm not done with your previous command: =
SMN_C2PMSG_66:0x00000028 SMN_C2PMSG_82:0x00000000
amdgpu 0000:2d:00.0: amdgpu: Failed to set workload mask 0x00000001
amdgpu 0000:2d:00.0: amdgpu: (-62) failed to disable fullscreen 3D power pr=
ofile mode

These errors do not appear without the patch, nor do they appear with
the patch if the greeter and the DE have VRR enabled (in my case, GDM
and GNOME Shell respectively). I have not tested the case of greeter
having VRR enabled, but disabled in DE.
