Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC88F57
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 19:48:35 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h26so25403900qtu.2
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 11:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zb6vaN7S0LgbMT0omK02MiFSOGzB3hZFddL85UgbNtc=;
        b=tk21pwefEBVMM6Vad6YYyAzMqyvEudg0OdILjnEmHfArGLEVUiV75MfXm953UCqqoW
         TGTqaJ+fNOokyrhg1UF3koEoe5NYGCZkRj6XqF6j88GGY/xMc0jpq81cqPatsHLMK+n6
         M3U1D4/0eTfXyPSD/M8syFX1XQjxFd0X68idrwULssnN+kkIhax+AOBaH0Nlrw4hgLkV
         aeoTBOg33kZHH4miFFpY2JLFyVqV8Tzu3pNKIf4MyFZy8ltTyADKgEHaS7+/kxn9Jc45
         KiElvzvWvy/G2BtahJPp/OCw2ym/m4x1HyEdcFIjqcWeHnUpNm2mfK0pQAM11VSGvQH5
         584A==
X-Gm-Message-State: AFqh2konEjRlg/RI/zraRtYXkiitcvzN6rLBm/vGB/159WXl7v1CW2pN
	yP6bPu7KF8x8sLxn9HPbRD3WiLBGtcTheQ==
X-Google-Smtp-Source: AMrXdXs1ZqM6G2FSCfhmo6ygSyE4zRIXSuMjrzvfeplaOff3Zbzow2/q4zDubE7pcKccNQ/zlxEQOQ==
X-Received: by 2002:ac8:6ecd:0:b0:3a8:18d3:8525 with SMTP id f13-20020ac86ecd000000b003a818d38525mr62074301qtv.13.1672775314758;
        Tue, 03 Jan 2023 11:48:34 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id b7-20020ac85407000000b0039467aadeb8sm19122911qtq.13.2023.01.03.11.48.34
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 11:48:34 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id v126so34308423ybv.2
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 11:48:34 -0800 (PST)
X-Received: by 2002:a05:6902:908:b0:787:948b:d5f1 with SMTP id
 bu8-20020a056902090800b00787948bd5f1mr2143969ybb.523.1672775313884; Tue, 03
 Jan 2023 11:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info>
 <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
 <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
 <9a03c244-adff-afaf-7385-d8e89cd3f338@leemhuis.info> <02F8DDF1-EC0D-4EBD-88F5-7E000841C337@holtmann.org>
 <CAMfi-DQfuro4c_VUrFHBTv8sPnwuV8XhTV_W7qswGeCC2t-wzg@mail.gmail.com>
 <19ea39c87df3c54cbc487466f806bc157d0bf563.camel@freebox.fr> <0611323c-2088-e6f3-1c38-7cf742dfb60d@leemhuis.info>
In-Reply-To: <0611323c-2088-e6f3-1c38-7cf742dfb60d@leemhuis.info>
From: Dave Chiluk <chiluk@ubuntu.com>
Date: Tue, 3 Jan 2023 13:48:23 -0600
X-Gmail-Original-Message-ID: <CAMfi-DTyhv=Pga+ds5REtxngwoXeufMYr_dOh93X75Pm9bbU0w@mail.gmail.com>
Message-ID: <CAMfi-DTyhv=Pga+ds5REtxngwoXeufMYr_dOh93X75Pm9bbU0w@mail.gmail.com>
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: mbizon@freebox.fr, Marcel Holtmann <marcel@holtmann.org>, 
	"Coelho, Luciano" <luciano.coelho@intel.com>, "Greenman, Gregory" <gregory.greenman@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 4, 2022 at 3:37 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Does it work in Windows?

That's an interesting question.  I did some searching and apparently a
number of other OEMs are all having issues with this even under
windows.
https://www.dell.com/community/XPS/Does-the-XPS-9520-support-Wi-Fi6E-6GHz/td-p/8229808
https://www.reddit.com/r/framework/comments/t0ghsc/fix_for_6_ghz_wifi_on_the_intel_ax210/
If I had to guess, I'd suspect that Intel has pushed similar checking
of ACPI into the windows driver.

Can we just get this terrible code ripped out until the OEMs get their
act together?  This is really bad user experience.
