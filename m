Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE55612C
	for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 18:48:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t11so21987244wrm.5
        for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NhgSfZDArluZLHM/ZGQGHtyPB2g1YM1L+AyBmippdgc=;
        b=E6H7FdlWYcATK/Ci37TDC97uxTfQV5wTZHy4seLU3weGUKtZUfpSHM5JUgph0J3fMJ
         tPcK6xSSZLn7dkMYTIKmrtgrCVdL6wehY5z1328CFqEJ+33VfHMA+K5GG7z0zYrGrg32
         x0b6JtYVnHsGSOKEJVkB40OKaK09JSx4dK1lEhvkXi7oTteeoaMo+cGjs5W6MOlW3bkn
         LVo65te+5eAEDA4j2QZlW121vCOxpHvfdAYe376s1EktIoJ9Kz8W53K/FhsZXycUu9ef
         +2lkpe6e1l6hLVKHkDjBBLOIiG22McoVy/sW9kvxu5S/4Q+o5AyzVf6rBWbiNCVdWwn6
         sRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NhgSfZDArluZLHM/ZGQGHtyPB2g1YM1L+AyBmippdgc=;
        b=24M8pg5eNTHqnDpH+K6p+gf1Hz35uplXRwFDhDD2K8oMkKYxELzFEbv2+rVKZ9V4yG
         4ctD5uTcgxCvc2lFlmYbEzGk8VgyhnYi8PpVv/YxTZVy8XAq3gZKy//ALspuCaCi330J
         Twg2S6VbxV37OA35HWWXzYcA+aApSC+496jtaA7qZZuVx5NibVVTviwpbhrypFTOPjuS
         V8VNISai9g4/NcDVe4Xo0ok+rtA6G1twORh/+Ib5rnI35x48b2NN3VYJq6TV9R4xe6L4
         1FYhRGWhC6hZcpNTDLWKbv4yeaJtjqcVGfidMqBzA5/GvZ1taAnMf1nEZOXVhp5c8qDQ
         DjIw==
X-Gm-Message-State: AOAM5335oTRt94GAEnG0GIN8q+hI4K1ZvROoFeSj9KVq9WRwvnyKdC08
	fB+1Zn1qM2lNla/VuSD6yXc=
X-Google-Smtp-Source: ABdhPJyfJdCZmE8tKzsiqRnR7Wsy3A+qRAqBFBPP0seRuR+2CuBc4MSPGkO7AsBhivZ2+kKQi2FkBQ==
X-Received: by 2002:a5d:6d81:0:b0:203:e187:1faa with SMTP id l1-20020a5d6d81000000b00203e1871faamr20083750wrs.381.1647888536391;
        Mon, 21 Mar 2022 11:48:56 -0700 (PDT)
Received: from elementary ([94.73.33.246])
        by smtp.gmail.com with ESMTPSA id h12-20020a5d548c000000b001f1f99e7792sm13796467wrv.111.2022.03.21.11.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 11:48:56 -0700 (PDT)
Date: Mon, 21 Mar 2022 19:48:52 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Jiri Kosina <jkosina@suse.cz>, Takashi Iwai <tiwai@suse.de>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	"3.8+" <stable@vger.kernel.org>, regressions@lists.linux.dev,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: multitouch: fix Dell Precision 7550 and 7750 button
 type
Message-ID: <20220321184852.GA20347@elementary>
References: <20220320190602.7484-1-jose.exposito89@gmail.com>
 <CAO-hwJKZUSTaWUpE_vsvAs-MNoZ8UJLgxiCyQ6OzwHYFZszf2w@mail.gmail.com>
 <CAO-hwJL4=OGv34mXq3de4QEKW15tT4gZDOBxhkuXVh5AeSafeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO-hwJL4=OGv34mXq3de4QEKW15tT4gZDOBxhkuXVh5AeSafeQ@mail.gmail.com>

On Mon, Mar 21, 2022 at 07:22:45PM +0100, Benjamin Tissoires wrote:
> Giving a little bit more context here (and quoting Peter).
> 
> """
> The problem with [37ef4c19b4] is that it removes functionality -
> before a clickpad was falsely advertised but the button worked, now in
> the affected devices it simply no longer works because the button code
> gets filtered. And user-space can't work around this.
> ...
> So the main question remains: why are we doing this?
> 
> And the answer here is: because libinput can't handle clickpads with
> right buttons. But that's not really true either, libinput just
> doesn't want to, and for no other reason than that it's easier to
> handle it this way.
> """
> 
> So basically, we tried to fix a choice on libinput assuming that all
> devices are perfect, for the only sake of making it easy for libinput.
> But the solution prevents further tweaks, and we then need to manually
> quirk devices in the kernel which involves a slightly heavier
> difficulty for end users than just dropping a config file or changing
> a setting in their UI.
> 
> With that said, this patch is:
> Nacked-by: me
> 
> José, could you send a revert of 37ef4c19b4, and add "Cc:
> stable@vger.kernel.org" and all the other tags for the regression
> tracker bot?

Sure, for reference, this patch should be ignored in favor of:
https://lore.kernel.org/linux-input/20220321184404.20025-1-jose.exposito89@gmail.com/T/

Jose
