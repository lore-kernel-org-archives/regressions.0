Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096103200
	for <regressions@lists.linux.dev>; Mon,  4 Apr 2022 19:39:44 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id bg10so22194425ejb.4
        for <regressions@lists.linux.dev>; Mon, 04 Apr 2022 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NU7HyoNi5meZJ6AGWzLvmGnJXrmedqwt4yUiP1S+dCg=;
        b=LmrPdK7D8KSejIMXvgQfWXzEV/KY6ZsFIOXpOfLYcmxokXt1ycWJVJ5BBbQc4RZ+4m
         Ij0yboQumDgoZPfnGCtP+DBbKVR+XYU5co738N4q2zihDCjnRMfR3nR3OfOVa6LM7pQE
         mADowT1BHanupnNcq0NojZ+S1Oub+rtSfYbECsjxhgpevsQt50yUmzwnj+a2GWtXUKPT
         vrsMxJXiI2buC1fXRD+u7C+61Fqf4JasghPdsYjmUq1NVvJnrnWHcc36uBqd1eoTgzfq
         tod7AjQS34oMihVHShMHtR4cv7Uz9WL1l0aewijORHN/c3VDFF2QoldPR0zSBS4xgpwo
         bGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NU7HyoNi5meZJ6AGWzLvmGnJXrmedqwt4yUiP1S+dCg=;
        b=jn2QmihhU82uiQILJqfosRD1+mpgzAChf8hawdTWoTY5dtXas9QOm+Au1gnMHQmWWR
         N7ZJwL0z+fRixTl0nRAsHL45U+7eWJqwISCnHjSodNk8FKmApUY3D7CUkEYhrSMSTv7V
         au+gCvP2aVqnpvtwDQuP30Er6BXtSoWf7IvVEEotGIaJ7y+SYgfuA93CrdtSGddDdBHP
         hH9FrmCo/Ra0gcyL9PKdHAMPHKHsuuuV37lNR4Q/ngqOIiTrudr08UJARvfM5fMVxvWj
         ZqjH0NU6sT0nBR05GMU83QbXXweTneQ1nCXxOXzwqD8QHfO8yOulkBMas5L6ppd0MMCw
         MmDA==
X-Gm-Message-State: AOAM531/l5Ggh1VBtopB0HadA63CBTs8NgU1xsxBxAI0w2bX3YvCmLl9
	RRpYg23jYWzuTsR1NixKFv5k0NsUDw8p2Q==
X-Google-Smtp-Source: ABdhPJwf+njJLTQQYntTOyiKLugPASzyX2p5fs8mxMEkTSLKyQsIlO/mL3faNbxx+FZvWyGg/vE+IA==
X-Received: by 2002:a17:906:4787:b0:6e1:409f:8deb with SMTP id cw7-20020a170906478700b006e1409f8debmr1695858ejc.80.1649101183211;
        Mon, 04 Apr 2022 12:39:43 -0700 (PDT)
Received: from darkstar.example.org (host-79-21-204-193.retail.telecomitalia.it. [79.21.204.193])
        by smtp.gmail.com with ESMTPSA id h5-20020a170906718500b006e7edcda732sm2052788ejk.125.2022.04.04.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 12:39:42 -0700 (PDT)
Date: Mon, 4 Apr 2022 21:39:40 +0200
From: Michele Ballabio <ballabio.m@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Subject: Re: AMDGPU: regression on 5.17.1
Message-ID: <20220404213940.09a56d15@darkstar.example.org>
In-Reply-To: <CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
References: <20220403132322.51c90903@darkstar.example.org>
	<CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 Apr 2022 13:03:41 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Sun, Apr 3, 2022 at 10:19 AM Michele Ballabio
> <ballabio.m@gmail.com> wrote:
> >
> > Hi,
> >         I've hit a regression on 5.17.1 (haven't tested 5.17.0, but
> > 5.16-stable didn't have this problem).
> >
> > The machine is a Ryzen 5 1600 with AMD graphics (RX 560).
> >
> > The regression I hit seems to trigger when the machine is left
> > idle at boot (I don't boot straight to X, I boot to a tty, login
> > and then start X). The machine after a while blanks the screen.
> > Usually, the screen unblanks as the keyboard is hit or the mouse
> > moves, but with kernel 5.17.1 the screen does not wake up. The
> > machine seems to run mostly fine: I can login from ssh, but I
> > cannot reboot or halt it: a sysrq sequence is needed for that. Note
> > that if the screen goes blank under X, it wakes up fine.
> >
> > Below a dmesg and two traces from syslog (they're quite similar).  
> 
> Can you bisect?  Does setting amdgpu.runpm=0 help?

I can try to bisect, should I narrow the search to drivers/gpu/drm/ ?

Setting amdgpu.runpm=0 works, the display now unblanks without problems.

Thanks,
    Michele Ballabio
