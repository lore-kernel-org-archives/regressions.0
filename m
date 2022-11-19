Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C236C
	for <regressions@lists.linux.dev>; Sat, 19 Nov 2022 04:07:58 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u2so9075399ljl.3
        for <regressions@lists.linux.dev>; Fri, 18 Nov 2022 20:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dtRW27/VFkKfRExNy2R07fG81X6WC5yaz70q9JRBAiU=;
        b=TtXIVPnDZ2ShtyoirzVFHNKPh8oO5RxHmR1Jln/WpZ2R0mz/omA64Nc4xWIcdeB5KS
         EG/6ZdqTJ6+dzZnj4B1/ba0XEB+3LnlGUarb0AProNgXWuIkINRtF1oKz2sd/XUTZ2wf
         WSXRATcVyhcRzZ0Zy7r7KwlOfrdcCG3GHRylR1qxE9M3m6nq+s0ypORbYGRxhGHP8ktz
         kcqToSSYSeBQ3fgd+yysQis00CStwh08l95BpK7x3sbSIdAixGyMcdDiDcfNCNJG4qLF
         jwXBF+9GTdUV6bTVsYdfcloCX9DEHY+i3LkH2jF6IOcbDAccSmg3q9WQXn7wdKR0NbYM
         GTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtRW27/VFkKfRExNy2R07fG81X6WC5yaz70q9JRBAiU=;
        b=enDVXW7sFMr+wIke+F9rVFLjoPpZM7EyVKgS1Pe5QM67cMY+mLWET5XoL38XSVW1I0
         a2/COF9MSgAIkTFF9uMfRbhf2c9XuGnoyItpPTQCYtqNcF/gUkSK1nCON1fzC5R7Nv8S
         f1SfKdFY4dXuMiYMjaJf5sXjUXDHMZbRs4U5liG0m+Dz0S+UxCni5P/8sfY4LewOIWIm
         c7fD1O9HhCxL8IIJImazV9CVPv/pZAjx4T8m07AP2WiXX325TVxH3jBk5hOt+gSjciwb
         MyoS/jxLjXOWalBJSgiXuiZIAjerk29EqOevA6vhASpV93XZLjs8hesnZb8UeG1U3FEO
         XDcw==
X-Gm-Message-State: ANoB5pnHJutByeYApAPhOlqb/7tPgiAsVbFop/46itVGituOLlQ0WRR4
	jB44o5zhi5eOJ6o7P4X80bX22QSbg+jxhzPIG3Ds8axsKH6m7Q==
X-Google-Smtp-Source: AA0mqf6TtkhSfRQWsSRKkFVrN1K2vpE+3E7DbjrBZGD1HMn4Be7sA4L0VCgEG63L5y4r/HHwk2Mwiv1G7ZioFSoo96Q=
X-Received: by 2002:a05:651c:198f:b0:277:6a5:109b with SMTP id
 bx15-20020a05651c198f00b0027706a5109bmr3472454ljb.42.1668830876279; Fri, 18
 Nov 2022 20:07:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jorropo <jorropo.pgm@gmail.com>
Date: Sat, 19 Nov 2022 05:07:45 +0100
Message-ID: <CAHWihb_EYWKXOqdN0iDBDygk+EGbhaxWHTKVRhtpm_TihbCjtw@mail.gmail.com>
Subject: [REGRESSION] XArray commit prevents booting with 6.0-rc1 or later
To: willy@infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nborisov@suse.com, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced v5.19-rc6..1dd685c414a7b9fdb3d23aca3aedae84f0b998ae

Hi, I recently tried to upgrade to linux v6.0.x but when trying to
boot it fails with "error: out of memory" when or after loading
initramfs (which then kpanics because the vfs root is missing).
The latest releases I tested are v6.0.9 and v6.1-rc5 and it's broken there too.

I bisected the error to this patch:
1dd685c414a7b9fdb3d23aca3aedae84f0b998ae "XArray: Add calls to
might_alloc()" is the first bad commit.
I've confirmed this is not a side effect of a poor bitsect because
1dd685c414a7b9fdb3d23aca3aedae84f0b998ae~1 (v5.19-rc6) works.
I've tried reverting the failing commit on top of v6.0.9 and it didn't fixed it.

My system is:
CPU: Ryzen 3600
Motherboard: B550 AORUS ELITE V2
Ram: 48GB (16+32) of unmatched DDR4
GPU: AMD rx580
Various ssds, hdds and network cards plugged with various buses.

You can find a folder with my .config, bisect logs and screenshots of
the error messages there:
https://jorropo.net/ipfs/QmaWH84UPEen4E9n69KZiLjPDaTi2aJvizv3JYiL7Gfmnr/
https://ipfs.io/ipfs/QmaWH84UPEen4E9n69KZiLjPDaTi2aJvizv3JYiL7Gfmnr/

I'll be happy to assist you if you need help reproducing this issue
and or testing fixes.

Thx, Jorropo
