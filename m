Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE306525A96
	for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 20:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764853; cv=pass; b=IiwMyKCsx77UkBdEaIQYc8DWo7xAMH5Z9w3T+mynMz+N1SJKe1iWWKoNOLf+Q1W8MmdJotqMFVwJ/ovjibyWF0GPMTMaJCMkj8Yc2343Dr3AylG/P3U1GixUrzeyEJ3RS4HStHs9mpqrbS1KQelzprXF8uOuK2uhyxQ3dZpylXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764853; c=relaxed/simple;
	bh=BS4FKlSWe4YKiPa1mlTL0BlAH622N4Vp/d8Gun2zgpA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nbTz9+ff7wFtMSGnEn3KoevVBsjyn6Vgc3T6KX9J1hfWYaXNe9SwG5cmXB2X/sYHJpHKTu8MVO6QJmd48ie21gHuBs49c2auFfuktyv4RY5X3oX8DfcjpH5zaH+hIKX7jQ4BZ3viPWEaBOiE/brVbh03CqJbmKkFek7+kkDrgR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLt57df2; arc=pass smtp.client-ip=74.125.230.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLt57df2"
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3a5a761189dso294291fa.1
        for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 13:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789764850; cv=none;
        d=google.com; s=arc-20260327;
        b=FNA8+5zNF90GX7+fhE4iYv1YygkliOSaBwXLUyUNMQHtAoNnxAENReXTNTzsyYsCID
         WRINTL+I9xVQ7IYPtmzesSnJmDhl9sSuiaamgYt2/axWU3rq6YHlZ+0PzJZqWOwhlx7E
         evnP01YgcuLmIKtAdYl6x3MmerZvKK1F0ZY1yJnRCLmlNZiDyTC+lQx+pSMcLCChctHH
         ulNVEjZIx9ofBQsMm6ZuQDFE9Lm1jlGyKpvfehmuFwJNVoWfWrI9ztwmReMUhh+bFjlv
         2u2zVwVWe4q2/pZSX6bpGfyBEFS/Z9VZO4ittsATDrWn66QOVC7p4FsiW159ee89uTWq
         ZyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zT+t8qTv80Y+uLS0biMhnLyuG4ml04HBZ8H0xfb4Y64=;
        fh=Hi51YWuPkGPl+o+QQFCkEuCgNPef+ggQN7GkeY6Y8Uo=;
        b=qrTkfsUUIV5orhoRT9xyQvDFmyKTs8RryG1o+7eM1vsq5YEedI8VkxbwsSmyY4DeE6
         NhaLJSHcozipxiZD4d3Pa4Ac0H6ciqJh2eDzka6ExPQC28OzSUUbzFKsse1XJPTq1Bh4
         MmOg/d1eGLhsPtEpiVardI/I6e8Tv+KeWI5WFdhu/vU96BixafXBLJLS55dxVaoTNSFB
         UUsE8OaHSCr40+eW3HbC+tiDkQkgttV0gISMeJgpaszRK3gw9/enDIN09/GX+ClhCe+x
         +lvb10eGaj0GC5nZE6WiNeOvbrrWuWnGyHQJ10WO6Gx3xsWFsoQ2OqwbQwIXhYVnbRWS
         3VRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789764850; x=1790369650; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zT+t8qTv80Y+uLS0biMhnLyuG4ml04HBZ8H0xfb4Y64=;
        b=tLt57df2lsolSKuIZJoLgAFjZ2z2DEZTKDQzenXTIHpqR+U3tJutElkG9LRYaue6P5
         2ytOtnFUuyC/NaEmxcEiwNmgRDL6A+e5xnICDRQSPRj8cQUuE40U4Keieqo7unIoAidc
         zgYIb2k5QtsjsxfReKHLDnUDJp3MrYaS7zwCw/bJp7/ftv/lSMTTL1Pxu/HkW3SANXCc
         CCMYc/8NWj2Z3/Rp4dQWHz/kN+6QKJ4VOqk6GkAlTrhzaJK4D42kxVRrtSXXyukPEzxC
         1QCqRZJ2aG44HqvEvIbkcNNM401vsRqIrXcKHqzX8QIVWz5x7RdZlJf+2sIOX8OwARYY
         kR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764850; x=1790369650;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zT+t8qTv80Y+uLS0biMhnLyuG4ml04HBZ8H0xfb4Y64=;
        b=Z84YfXOvd+RnLfjwwRt9FDbNCVrKpLVag+ZPJUXRI+i/7Cp7SvNgyTY/i85hHeCnGb
         CYSDl8+Juxb8mAIsJ6FW2+qzJoP21XADjLr4MOrRircLv2/4OAJPLq+xlK+PVTr+eMCj
         Hh66u/Y9ht8MJQFNBnvsC0YZ2h2zqhSOcXfpBzgYkw5C0FQGHtm+UnhJ/t87R+MHANOl
         gWuC3NgsoxphNBOYnIxQJhdntrPEwYj8gTtVn8GaDp6qnoOYqzpKUrcyMN3fA+EK3fED
         zpz5ti1Jawc7dyHLBVNSRotvPV76uZ4K8cKyqbCkzM58uHZygp+xoztwDNv3YiIibs54
         8R9Q==
X-Gm-Message-State: AFuF++noDeP/o0ndKqtG9oQ8HMkvzj+dGgp7n8kAG1/xxrK2URZVL8hv
	gwVg9c6M0l6wB79H8p2is+4g84/o3E4ZibDsqD+qB3RYW0DSWfMo7PW5ARRsK8T/qnPojpSA48p
	4uSJScBN1+j5/u8SVepAF+v9SbLxkWnXzxDiqHncAsoZi
X-Gm-Gg: AYBFou0DDuVZJTHof1TuofJFbt9LyWTnNmHcbfngvYnIuDnmjlpRySVXj9BdjZ9Vb4Z
	j9NXdszupKrjqQAjImo6fhMuxh0f3PvnNHrr0gFss/efpIAQUxOBmWn108bW3iwwiqLZFGsBk1n
	pydE0KKCx+CVMSTWUZRrzHU3V9EmE4Bty7pdeFnX1OhwkgVWiOmuXepSr6juoYuK4r1mhGg97zp
	dJxPhu0COlO9fBqx3vXZ8WXVUHrR3phtW3AHZRfKMWcEgZ4Fx3vjS0Od++rEoDY/VtB2OPqTcXv
	IBF8ypUSU8CuasrIwG6t+MwJTH3rRM2qtXsK37exMDdzv5s8R7rxEx5EjCw75I8=
X-Received: by 2002:a2e:a902:0:b0:3a1:f7a2:115 with SMTP id
 38308e7fff4ca-3a5fdefc590mr7156161fa.1.1789764849672; Fri, 18 Sep 2026
 13:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Aoto Tokizawa <aoto.tokizawa@gmail.com>
Date: Fri, 18 Sep 2026 13:53:58 -0700
X-Gm-Features: AcwNN1V4DMDStafjE4EC4-jR-kkfXTEJTrlkcDMh_v_mfQPg4IGLhLh7_T-ySlY
Message-ID: <CANxGDDEp4FrTo5cqhwMOqqm7ukh-G9z_77eVWiTgbTzNNYMRWA@mail.gmail.com>
Subject: [REGRESSION] ASUS Zenbook A14 fails to boot (Internal error:
 synchronous external abort)
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

Recently Linux 7.3.rc3 fails to boot really early on. Linux 7.2.6
boots just fine (with identical sysroot). The following was
transcribed by an LLM from an image I took with a camera
(unfortunately no text made it to systemd-journald).

[    0.177281] Internal error: synchronous external abort:
0000000096001610 [#1] SMP
[    0.177446] Modules linked in:
[    0.177460] CPU: 7 UID: 0 PID: 57 Comm: kworker/u34:0 Tainted: G
M    W          7.3.0-rc3-1-aarch64-rc-ARCH #1 PREEMPT(full)
[    0.177495] Tainted: [M]=MACHINE_CHECK, [W]=WARN
[    0.177510] Hardware name: ASUSTeK COMPUTER INC. ASUS Zenbook A14
UX3407QA_UX3407QA/UX3407QA, BIOS UX3407QA.311 08/22/2025
[    0.177542] Workqueue: events_unbound deferred_probe_work_func
[    0.177564] pstate: 214000c5 (nzCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    0.177586] pc : regmap_mmio_read32le+0xc/0x24
[    0.177602] lr : regmap_mmio_read+0x40/0x68
[    0.177616] sp : ffff800083783920
[    0.177626] x29: ffff800083783920 x28: ffff800083018348 x27: ffff8000b1e8b700
[    0.177649] x26: ffff800081e8b588 x25: 0000000000000006 x24: 0000000000000000
[    0.177672] x23: ffff000804cc3800 x22: ffff8000837839d4 x21: 000000000000d008
[    0.177695] x20: ffff8000837839d4 x19: ffff000805731380 x18: 000000000000000a
[    0.177717] x17: ffff000804dde980 x16: ffff0000837836f8 x15: 0000000000000000
[    0.177741] x14: 0000000000000002 x13: 0000000000000001 x12: 0000000000000000
[    0.177763] x11: 00000000003662c5 x10: 0000000000070a78 x9 : 0000000000000004
[    0.177786] x8 : ffff800083783900 x7 : ffff8000837839f0 x6 : 000000000000d008
[    0.177808] x5 : ffff8000837839d4 x4 : ffff000804cc3800 x3 : ffff8000b0faac28
[    0.177831] x2 : ffff8000b0fab368 x1 : 000000000000d008 x0 : ffff8000b437d008
[    0.177854] Call trace:
[    0.177863]  regmap_mmio_read32le+0xc/0x24 (P)

Text was cut-off, but in another image I got more of a call trace:

[    0.177554]  regmap_mmio_read32le+0xc/0x24 (P)
[    0.177570]  _regmap_bus_reg_read+0x68/0xac
[    0.177584]   regmap_read+0x64/0x210

Let me know what I can do.
