Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B6B26CE33
	for <regressions@lists.linux.dev>; Tue,  8 Jul 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751975949; cv=none; b=Zsv7nRlnr8na6je8RB/yRFrKi+R9hRBFrW948KhGkb4lYBtRDNkx2XUQSwt9Xgmkq2cqABLEBV8Vxj5vjGcKM3irmhDZ9FMYrieo13psjiqJ37Zd07w6f9B57Qm+g7Z/p/gJ/DwxB/I9Ycga0HzeIFogLAQyH75seMOrS3Cn1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751975949; c=relaxed/simple;
	bh=l4YWMze/oS4h0PoeJI6+srjACyEMe2Xs4EmUu6v8QWI=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=QQK4mfwTvA0mJxNsfex5lcpqJDczK8lCIiMHOmiMVymygPfo34y5XMfVEbk0KuNubxePIuzMCMLO9RnyCaobVigNAybe8Gra/pJaOwqL2zw56BJcHImsg3s1Oy+lg5BRdthqTAmuyd49p+Ffl+UQkVsEjVwhTNb09EX6kmZ3TtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Roct4t2V; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Roct4t2V"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81826d5b72so3758950276.3
        for <regressions@lists.linux.dev>; Tue, 08 Jul 2025 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1751975947; x=1752580747; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtzSxUVKERYTmkdWodmf6sDIEA7o3urEegtQwrIBFeo=;
        b=Roct4t2VROpDGsOcdeICpB/McM8MsKLq3wpD/1h2Au7a4pVtBgIkDyYnmEGCtPWi4i
         uimWyGN3Uxs8WQ2Q3yUU8+s6P34FSEnupYJ1lcwcD7XvUEhhZt0WHHQ779hDdIOcSlfP
         mNd45Dy2W4GSVqHbe7wrgijWnqXYamRnxlefkwCEOMniIjFPCACh5j7L4+aUMqJIn1IF
         iqD1bYQTjhhCy6JSvj1y/2FGSuK6E52Sv82h9OeP2nL1aywKuIOp8b/iLxP7iSo7xYpG
         g60XIj8I3/ICqJzn7ITIx088EUfTzUEt3Vk7Qsn0Oo0R96IHKQmJpd4R7hiNDVjrg2YL
         5Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751975947; x=1752580747;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtzSxUVKERYTmkdWodmf6sDIEA7o3urEegtQwrIBFeo=;
        b=nr8aLtxosXTzyIqBE3mgfGhIBk+Uopc/HFD+dUu9AuctnJ8ZvOwYktg2aZad1GVzG3
         cTYEcj4ccSYsu3kkTmHaYP31OUyjdLNDkiRYHimB+n1xzaQVMTb5WuUaXcfOuBS2R01u
         xfFpQv9ZFW+Pw5cTAQjsZJ8h5GAEp5BaeupHdQdSVGF0WQ3/MsBFvFPAAMDIVnlZQhfc
         TyDb98DibW9N4IJb69J4SayxK47sSkyJ6fwoeOPQnEoG6hXaFLSAfYEPluQKNOPZ/Qox
         0kUdzkQbwaInIAlE1/3J6eIYPY1fYaum/T1mENmXYLrGQPJv/+NGpQRizCch7hCTiDrN
         kscQ==
X-Gm-Message-State: AOJu0YyNgRy3vF7n0jesBWiQQeujqjL5gw+WvMLMPfsGlzIScfh/6RR1
	7GCzHATL+NEbsYhxnNs9oSneEuNANiPzktm1fqkfeuycJwp+R8AD+rDVQ9RR09GIBshXSzsNbwy
	ur1+9SKorzI55Z27RHhl1J8/kKT8rcsOOFKxKJxuJKQ==
X-Gm-Gg: ASbGnct0DD9WIfv4aSsu7cE6/Iri19Gj0/w8TzbZuZF+5hcii45zL+SeTH/iNsUYe6d
	5P7LOe1x0nRWVQ/MLWZd2s2jJAckkfB6icJRkDMYrpeekVO+gg02//ChTo19P+UcUNrApWE6eZT
	5TbI9klbwycr3v5hf0VMCoqFpo4XY4yki5q78eo7EOyw==
X-Google-Smtp-Source: AGHT+IHldcdfL3KDEtXQ5coruO648VbCeq4DNQV8fjNhsOKR6jna0NqzlmNfbozuk89fRAZyu9pcN0kJL/if35bHIeI=
X-Received: by 2002:a05:690c:46c8:b0:70e:2a0c:bc5 with SMTP id
 00721157ae682-7179e464094mr49136347b3.38.1751975947430; Tue, 08 Jul 2025
 04:59:07 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:05 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:05 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 8 Jul 2025 04:59:05 -0700
X-Gm-Features: Ac12FXxdG7SBioohOVIdrl2kRCgFlhwWfZBNI-8C0Yojen0DOxGOdqxZG-1I8wc
Message-ID: <CACo-S-0GQ5cmyK=xXjWxJrTfUu7_B2gHD0z5fO2O=QVi3CEt2g@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) variable 'sys_info_avail' is not
 needed and will not be emitted [-...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 variable 'sys_info_avail' is not needed and will not be emitted
[-Werror,-Wunneeded-internal-declaration] in lib/sys_info.o
(lib/sys_info.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:5c04e00f1c1b59acf474835a714df4aec7228b6a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  58ba80c4740212c29a1cf9b48f588e60a7612209


Log excerpt:
=====================================================
lib/sys_info.c:52:19: error: variable 'sys_info_avail' is not needed
and will not be emitted [-Werror,-Wunneeded-internal-declaration]
   52 | static const char sys_info_avail[] =
"tasks,mem,timers,locks,ftrace,all_bt,blocked_tasks";
      |                   ^~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:686cf90434612746bbb46434

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:686cf90a34612746bbb4643a


#kernelci issue maestro:5c04e00f1c1b59acf474835a714df4aec7228b6a

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
