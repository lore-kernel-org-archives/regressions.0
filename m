Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739A537E4
	for <regressions@lists.linux.dev>; Fri, 16 Feb 2024 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708084312; cv=none; b=j26uX+MXBfM1tdixePkRdUD6rStG5YIfViuCCnibjaRw9wazvTucfFibWs3iB6E488NQYZfHJlIzhGByHNvXl5NI1OzRW/SKuVt5wHZc0XJ0UbFzMFWLvZgbjPnS067yDl5lAev+TugwhwJ8+AMrusbEwtILEHYhoCbzT8b7o7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708084312; c=relaxed/simple;
	bh=8c8z7IrXnQ8qHY9q5B6SwDk99cpEbxY5gPfy3wS60u0=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=AhNXSwIzUiwwbpRnCIvZWKMuw7ZUnO9SuKeIOxg5c3dXLMOzET0Hw5oJ+RzXzefdFOwuFapbjzli6Pb+SsZHzln04nEaG1fJRzGaRFjqj5UGGDXCn6CNemi2j3jYprduDeMKC/eE/iiUtITAx+IbcM9jWykcKNcXt7Tt/ypGPPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ag6by5pT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ag6by5pT"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51296ca7f78so520867e87.0
        for <regressions@lists.linux.dev>; Fri, 16 Feb 2024 03:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084308; x=1708689108; darn=lists.linux.dev;
        h=content-transfer-encoding:autocrypt:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smi+XemBG3ZogtSdkPCilQ1a7PgwI71wggR8N7UK79I=;
        b=ag6by5pTagjugRM8Kr1u4biFN4jBnxQdsolXaUDwfDDzqC2+rjEI7rLIenIHfiUzMI
         RZ/xXqnDsvMAvMuYBJ4mvLH640yH9aijLATBCrbhzQz65gWIVeZMYVdUd/0zVJL/d/Fn
         lWen/YLMKY49u/hULzBYod6MelzEe/PTmKV6ydXQ91lEBXWbIh8XwlxUfQhDG3iAYt88
         NLCxQT/XanJuO/eHd0xirNtqEqH4nG2V7XseWG73PClO6YSmsFs4NEFb9d9mWAnOZOdy
         VV1nFDh7wygM1eNEKcRelVCPBDI8RAN47VhdCQvksIS+3WHxmIsZHh+7UASSRcNMAUub
         bEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084308; x=1708689108;
        h=content-transfer-encoding:autocrypt:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Smi+XemBG3ZogtSdkPCilQ1a7PgwI71wggR8N7UK79I=;
        b=W+xniOR0pTbegDz6/sUUTsQMkxpkSI8QhoBtgBmhBbYhKhNHnOUaMi+pwgfIwh26k5
         XeK70vs1+fXLWyJh7Yb7zw19EZX1O1gSG6sRWU1eebyImnIOw2BzcaC17dsCaD+gA0l2
         +4NErggnglPvk3rw3xzeCk2Ye7BVCiEj26Cc8ZPiivIn8UyCfxLsfm9wu2639iC133Sh
         7Pz06kEPXKfsjs/ECCuOm62rVO0vnES0sDV0xrl8fpAE4HVfUgU8iHkRhOaMY6HBEBQz
         VV6RqpjIB6LAu3CoMYezdKWK3WXBEm5kbd6o/JmADF4mc0Y+U7Cr5+9qTq6rRziZb44C
         H4jw==
X-Gm-Message-State: AOJu0YyQlkOWXOPDsSgIgD61XQ19TGYJtz9p6J2q/uAhNQHdH/nmIvNq
	3zch9n33EdAavSQgq+SyVmIQvIPfc5pnKjqaDOLxRfCVAPcvt5Rd
X-Google-Smtp-Source: AGHT+IFMtn99C75IesMt3iYhbPCYI8c5GZvGp5FMz/36kPmrZYm+qVBychNQaYtOK+DT37/dO5wtAA==
X-Received: by 2002:ac2:59c1:0:b0:511:a088:faf4 with SMTP id x1-20020ac259c1000000b00511a088faf4mr3431515lfn.4.1708084307902;
        Fri, 16 Feb 2024 03:51:47 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:cff2:caac:f1f6:c049? ([2a01:e34:ec5f:c111:cff2:caac:f1f6:c049])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c3b8e00b00410709fa0d3sm2130605wms.33.2024.02.16.03.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:51:47 -0800 (PST)
Message-ID: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
Date: Fri, 16 Feb 2024 12:51:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr-FR, en-US
To: Linux Stable Mailing List <stable@vger.kernel.org>
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Cc: Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>
Subject: Regression with Lenovo ThinkPad Compact USB Keyboard
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear developers,

(sorry for the long CC list, it looks quite long to me, but I tried to 
follow the issue reporting guide as closely as possible)

Since patches [1], [2] and [3] were applied to the kernel, there is a 
regression with Lenovo ThinkPad Compact USB Keyboard (old model, not II).

[1] 
https://github.com/torvalds/linux/commit/46a0a2c96f0f47628190f122c2e3d879e590bcbe
[2] 
https://github.com/torvalds/linux/commit/2f2bd7cbd1d1548137b351040dc4e037d18cdfdc
[3] 
https://github.com/torvalds/linux/commit/43527a0094c10dfbf0d5a2e7979395a38de3ff65

The regression is that a middle click is performed when releasing middle 
button after wheel emulation.

The bug appears randomly, it can be after 5 minutes or 1 hour of 
keyboard usage, and can only be worked around by unplugging/re-plugging 
the keyboard. (I ended up resorting to simulate an unplug/replug, with a 
script which echoes 0 then 1 to /sys/bus/usb/devices/<id>/authorized, 
since I was afraid to damage the Micro-USB outlet by physically 
unplugging/re-plugging too much).

Those spurious clicks are very annoying, since they can open links in
new tabs when scrolling in Firefox, or pasting text when scrolling in
terminals, or other unwanted stuff.

I witnessed it with latest kernels (Debian unstable) as well as stable 
kernels (Debian 12 Bookworm, stable).

On Debian Stable, the last working kernel was 5.10.127, the regression 
appeared in 5.10.136 (i read all changelogs on kernel.org between those 
two releases but couldn't find anything about hid-lenovo, so I can't 
tell exactly in which release the regression appeared, Debian upgraded 
directly from .127 to .136).

I reported it in Debian [4], and apparently I'm not the only person 
suffering from it [5].

[4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#32
[5] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1058758#42

I would understand that such bugs would end up in a development kernel 
like the ones provided by Debian Unstable, but not with stable kernels 
like the ones provided by Debian Stable.

Regards,

-- 
Raphaël Halimi
