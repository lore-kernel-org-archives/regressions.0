Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E01BA2D
	for <regressions@lists.linux.dev>; Fri, 27 Sep 2024 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727443221; cv=none; b=VFVeS6d4dnqbz4m5XX2Oyb5qMJZWb78oD3HiUJyB85mKN8QmCKeVup2KxXPa2QtMc3jmzi3SLL/at1Kh2JiKooQodJOtHHDlnIMHR7YvNfNwBEMaRDGpAQ4GVJQ3H3ZVuPv3UVvvZfv2KAUR66vaJdrCN7ZgsxO9c6hFxo8E4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727443221; c=relaxed/simple;
	bh=XLEq1M/49fUMTjfhqFfpf7ALhKCShm0WYNc+42j6yLw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U0qAodK4y2NK4RpMKrKzjs9W40XXby56llz2fsdhLioKrXeUQndjQfh2heW2SoboVR6NZzUzE8jFD+CgaOr/h/VT+zNoVwWokQ94nazkcTY2HA1DjJdrrg70ghD7RzZF2u+3qwU7vXCE0tKT2vDzevzd1iYcQb+5+xWVTV8r7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQjIx1pA; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQjIx1pA"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f763e9e759so25000701fa.3
        for <regressions@lists.linux.dev>; Fri, 27 Sep 2024 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727443218; x=1728048018; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FDLCOPi5QpNo5CUL/g9mtdJyv1l5jh4HEp5d5eTLWQQ=;
        b=NQjIx1pAugYM/InhG+hh11wOBZnfdIAUMstz7aO/zPudT91TGjIgFx+Fp6umGO4fkb
         Bm3V18Yt5c+uDJe5PME92E+fL8uOJbvEl8rCvjlOPRwHZbjaflSxbjbgPsg+kSL7bGym
         oAduqFL01tC2pNGSUmanGMmxmF2+2pizl0euVI0IIbTf2SSLN757iCQbIHQAfqjkB/pL
         agxNF6jXhXhZf06My8Z0V033lhh4TlPvAQWBPrwiq2eNwR1dRArzAxV1U++ojUfVnOjk
         D/Ch+xed92+xsdqrgkxavfl7kHZIC4VRq3UXX/DGpBgHBzGywjSkuQk8tuPJYySmTxuZ
         ZXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727443218; x=1728048018;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDLCOPi5QpNo5CUL/g9mtdJyv1l5jh4HEp5d5eTLWQQ=;
        b=b0WmSOszqoz7fKLACIrtcAE+TgNb/vJncEsO0/VJiKkYgnPsL+Ls2TFgaHACBctwcv
         /hgqArCPc+Z85nsFvB1JCEq3r4LK6AwZhGI/1b4A2cN1VNFls9Mh5xsJrn8zrphv5iwC
         oQDfu19J4wVhyK6UaK+2V17zfvqcs0RNDu3XSa+fRMyCNN7tiyB4bTT1Za9ckn0/FpRI
         NExHp/LGgZy2INW19J9i2ijx/1bv8ic9JZfX8saMfgcWWXYOmmgUDsfdQhl2eZowjGqF
         ajv9TqpsblhNQGr7o03FgRM/lKaSubG6CrjcOVpktAjESH5ReZAGZYhwMTtNq1deIgYn
         ANkw==
X-Gm-Message-State: AOJu0YwltvBiYWmEb4CE/1ixpnz0nJLEQzdctzroKVYNHXfOeJmY74C3
	TevTR2jVM38zc+vByP11GVWO3qhn4ZBAfkaQ/vSUZeGp5b5kSxNY41df6hIa1fu8vUTjl+OVlwD
	/qkYZNU+jpCdKU1ivWtWIexdF1tczuhhZ
X-Google-Smtp-Source: AGHT+IEUHQwZRK7jrAp9Ut+mkqO3YlI8KASsn2Gfd6yMLa0Dxv5U5m/LgKll+4N2LhE3PMxqHzUwm/udd+k9TeVx/+A=
X-Received: by 2002:a2e:a541:0:b0:2f7:cba9:6098 with SMTP id
 38308e7fff4ca-2f9d3e78d0bmr23175501fa.19.1727443217855; Fri, 27 Sep 2024
 06:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sim Brahmi <sh4224hs@gmail.com>
Date: Fri, 27 Sep 2024 15:20:06 +0200
Message-ID: <CAMZnB+fOn6YWNx5U8PYkF=wLgE-E4mcixJJQkysK=CM6JYbE7A@mail.gmail.com>
Subject: self-debug using ptrace bad behavior?
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am unsure if this is the 'correct' behavior for ptrace.

If you run ptrace_traceme followed by ptrace_attach, then the process
attaches its own parent to itself and cannot be attached by another
thing. The attach call errors out, but GDB does report something
attached to it.  I am unsure if Bash does this itself perhaps.

It's a bit hard for me to reason about because my debugging skills are
bad and trying 'strace' with bash -c ./thing, or just on the thing
itself gives -1 on both ptrace calls as strace attaches to it.
similarly with GDB. Unsure how to debug this.

https://gist.github.com/x64-elf-sh42/83393e319ad8280b8704fbe3f499e381
to compile simply:
gcc test.c -o thingy

This code works on my machine which is:
Linux 6.1.0-25-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.106-3
(2024-08-26) x86_64 GNU/Linux

GDB -p on the pid reports that another pid is attached and the
operation is illegal. That other pid is the bash shell that i spawned
this binary from (code in gist).

it's useful for anti-debugging, but it seems odd it will attach it's
parent to the process since that's not actually doing the attach call.
If anything i'd expect the pid attached to itself, rather than the
parent getting attached.

The first call to ptrace (traceme) gets return value 0. The second
call  (attach) gets return value -1. That does seem correct, but yet
there is something 'attached' when i try to use GDB.

If I only do the traceme call, it does not get attached by Bash, so it
looks totally like the 'attach' call has a side effect of attaching
the parent, rather than just only failing.


Kind regards,

~sh42
