Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE73234
	for <regressions@lists.linux.dev>; Mon, 20 May 2024 04:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716179078; cv=none; b=Fvo4HMKGodneJ7Z0piU8xIyBRihZo+Ij1zZ+wzSQ0qOGwHWB8ud/YIuAC5ubZ6XmUh3ILfYytxmpjaY3pTUkUqRLQGFnzaQfupQCdr4KuY0lFETHYiCrmHBPZN6hrjpiXPCH8O+qqW4lezYupFhIf+SffzXtTKRWzlId7DqUlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716179078; c=relaxed/simple;
	bh=CMjre8eqoa+n/Ovwdg0ybmtM/IiQeBkqzLPLOKagbD4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Oj0vWo+4w8VchAJCFmMUt30/XHu9Mgj+ovOvVS09f+/OjgbYfkkiVe9MlRZmC9upVnWvZO1rPKlxgPiGLr27aPfK0At6yvC7PcMp/MTbFX3g1DoX/H6gVOksXYx5Ab4z8azi3uG/LPoLAPXhMqp1RdNV9iMC6IThq5mEl8Oj1Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keUmZrQw; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keUmZrQw"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e1d6166521so29304761fa.1
        for <regressions@lists.linux.dev>; Sun, 19 May 2024 21:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716179075; x=1716783875; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+gISWTiquP5HejrUhniHY0swRmnzoJSGU80JZROc84=;
        b=keUmZrQwMKyR1qJS4zwrbuyPGRP0zuMoyDmqsh33445r4QpvjevOafP11rjTMYfW/c
         oKcJJ4sURgxcU33cYSGeSXCkgbwJfoefRnXiKD3N3JXrwzjGKJ8TpI6Lpvw3kDjl5piu
         yhmXsui5PyFxBro1+ugnRI5aIgOshAV2UP5JSzmWNnRjGT1e1wCY+Jlpe3tG1OsT5NIe
         2tPWOaV5Ftz2NBBBrfn6ERSYZlcjnxACSnys2UOlMoZgJz5pyvkCgBqP0BPiQEUscBQ5
         PXZ3e1xNln0JxZDq1j+0+1qQJxeoAEybcDF284NMm+eIo0qKDJxQ4MQdsCyaagrqxFRf
         /tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716179075; x=1716783875;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+gISWTiquP5HejrUhniHY0swRmnzoJSGU80JZROc84=;
        b=hDX1hIfnrcgUUdFIEyidueTw1sPZkM5UWc2uZ/mAm/b5tby6xf93bwmfk4hSgie4Ni
         A6ADf5Hmzm3dPMD5v9jgH7FGWipqegn50tvaqUDjbYMGpWST4npy0IM+TjkWM0Z4cQTb
         duTR9GhWyjQe2YZtvMZhY7kK3PJKj3lEDxoEdKt+ppDRDJMP5vJNPQdsZ+hrRc9n0RT4
         njG2jOFf3X1yTekMo2BFhn5O5CuhSeYUS9sSxxxI0aRv5MB58jAyqKVqBJEOyswcnEIs
         L0vR/KEfSHU1oYhLs/cdzi3ewREkt+1qZjk86AOCl8dbd5gsKGHl/R/cmrqz04b9cwwU
         4UFA==
X-Gm-Message-State: AOJu0Yy/RL0RIZrMr014X2DyDdkNpSHqcNLhq2nwNUPNKUW9wY+MkXD7
	DuL6XvxVsswAbI1HaJPgu/z2o6vwUIZARltdHEJ2zMTJdDIDNsEOMYwL3SHv
X-Google-Smtp-Source: AGHT+IFtMqQY9+PIVIR7BVM2VGq4Dm+ftNT4ctaMzhBskuc380adOXOhoRCITwv0JKD52jTBTrUYlA==
X-Received: by 2002:a05:651c:b0d:b0:2e7:16ea:f50f with SMTP id 38308e7fff4ca-2e71714cb37mr17779631fa.6.1716179074678;
        Sun, 19 May 2024 21:24:34 -0700 (PDT)
Received: from [192.168.88.41] ([94.180.2.195])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0bbcc28sm32420151fa.11.2024.05.19.21.24.33
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 21:24:34 -0700 (PDT)
Message-ID: <eb52e700-0cff-4cf7-b74b-46457bec03d4@gmail.com>
Date: Mon, 20 May 2024 11:24:33 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: regressions@lists.linux.dev
Content-Language: en-US
X-Priority: 2 (High)
From: Alex Murkoff <413x1nkp@gmail.com>
Subject: Arch: release 6.9.1 broke GPU rendering on Hyprland
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Updating kernel to release 6.9.1 breaks GPU rendering with NVidia on 
Hyprland.

All the relevant info can be found on this GitHub issue:
https://github.com/hyprwm/Hyprland/issues/6134

NOTE: It's specifically the kernel that is to blame. Hyprland changed 
nothing in their WLRoots implementation, downgrading to kernel release 
6.8.9 fixes the issue.

