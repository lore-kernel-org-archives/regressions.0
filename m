Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2751380
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 12:11:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so12696210wmb.2
        for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JTFl8KCFidacHzHAzwVR33OH+oMKyAXW2A3xkAdwji0=;
        b=J4p/cLsrWdEGqs5e2GIKxoafZOqNahTBFk6BgZsLnxL7fmcPX4CIUEyfS0lNksIPOz
         tL99btBZDSCY+Z6OVsL6gDGHPTQfoCIwikGl+Gs/JWbhheLuUT+XL5kSKG5QECnjvI/m
         TdHLPmmcLLlBCWYnUere4za7t2WAum8yvPnHFHL0YpIw3JNYTj+qpfB1kEIhnJ02PN2Z
         tyzBGywas0dmCuPktjapZ80gEwVuFsITMmYp92AqdU8bBKyVl1Y0+5bS7UgjqcZiB+ug
         sA6Vd6nrka1Bv+Ep5rTm2kGdSshGr47NYDnf9bTea3JeZUWtE8bNdlidsr0crCxjUE3P
         6R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTFl8KCFidacHzHAzwVR33OH+oMKyAXW2A3xkAdwji0=;
        b=Ac3Cfk4onYHrMcTRI77nCtdA+1vHiPGB1ORfv0ZBkIY0J7S9Qpi5DzrKotleoNSj7/
         HC3H1D/Nh/8CbeABoG6i67hq2u6XaAn6RgrnUmc03BdPjxQSUroCshCBYPXlWuG9vBfy
         z+FWVq9m4J318OehgIwl5wNbrPpxZW9xrQDe/zIAQcQzR4dRvSapI0ZMJOCYsS6Ei5we
         eKBG01aXwumbEUOLi2/ac24JvNoMKWfalydrziREbYBLzW7Z7vkwmlthqzi55LDy6VIK
         20qnJanoo+ypuLe1Cfn6FfI9QcRPMScM85Z8OGJ2AvVgHHRq0RdhrX8rzs0U4EsdufEH
         l4lA==
X-Gm-Message-State: AFqh2kq0XFdio95G4F8680D2HKzp6zNo22M0CHWPC4lWbD2l7Tf6oUWG
	vBlacEcCnQkhH5qME7YZr2vYx4EQbxF+tga8LatCbQ==
X-Google-Smtp-Source: AMrXdXvetO6fQegu/4E4RSnpJxxq527M9OI7SPO8/UyHMUs6ms1Yv+difJP8RbF+w81HJdiHO+Ng2qi4y9UbEdoc1IA=
X-Received: by 2002:a7b:c7d2:0:b0:3da:facf:a0ac with SMTP id
 z18-20020a7bc7d2000000b003dafacfa0acmr1728900wmk.171.1674562314130; Tue, 24
 Jan 2023 04:11:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
 <Y89n98fRfTpLmPUg@kroah.com> <CAFJ_xbqMx8LsD_Ry70jnqVmmhyGjTFpA-Gv7SpRR21v3Djr1DA@mail.gmail.com>
 <CALFERdxxAt5+Y0nxbEieYSZX8YLTA9aogtGWLLZBEpGdbWxT-g@mail.gmail.com>
In-Reply-To: <CALFERdxxAt5+Y0nxbEieYSZX8YLTA9aogtGWLLZBEpGdbWxT-g@mail.gmail.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Tue, 24 Jan 2023 13:11:43 +0100
Message-ID: <CAFJ_xbrAVZDtXwe0Ku0V7b1xp580N+ao0caCRP1xiHBr11oKyQ@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Sasa Ostrouska <casaxa@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

> If you need anything else just let me know.
>
> Thanks
> Sasa

Sasa,

Thank you for sharing logs from the working version - could you also
provide dmesg for the no sound scenario? You can also share them using
e.g. https://gist.github.com/ .

Best regards,
Lukasz
