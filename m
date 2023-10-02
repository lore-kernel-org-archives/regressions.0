Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F5818AEE
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 14:40:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-406618d0991so27696055e9.2
        for <regressions@lists.linux.dev>; Mon, 02 Oct 2023 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696257655; x=1696862455; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=azI3yMPzAcZmIPttwUHbyoUesdGWRU/mZo7qOrVX4uo=;
        b=Kpt//XEb1SAU+8IZKhErWEvtuIlzs262aYtxY898il6IUwvskMRHSzLp/hp9dmPtW5
         Uhlyq535BE6ZwjSSQ4i+aEOOAKkwIpsmQJA+gkzl7OLGP3rkEu4MMcCR8ga4spdiXu1U
         Ofo9B72tEDF+V6Yx6yXGd71nEIsaHlocs67K+Hs/D4HegoSyIPrhA1LrkQD9K37WmXm9
         WYTR7mU27GBoHKzyzgreo7lrvloLMkT4SERF7EtWlGkcmgRgxbSjpTSUKaRB+J3jrYpZ
         0yV/VdeooLsr3oYFnmYmqbpaD3rMVi9l4bKVxPwUzy3LCjMXaGRr5qJhSHQQHO/4D+pT
         ATDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696257655; x=1696862455;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azI3yMPzAcZmIPttwUHbyoUesdGWRU/mZo7qOrVX4uo=;
        b=tt6+1Wr1sIpijxemXDwhzd1L5ZQME0bmZin2fgxUN83uZKaPcp+wYwuV1obn7dE58f
         nvp0l/GGWq9rcwBUSfQuu2MUU6k0GC5KelfdXaQoRA4nddPJ44X12c406RX4LJktc6Yh
         6arbyYdohZ9kC7rsWgtlQXlARHzj1I8YqPK2GHYqItdaGZlgo7bgAXS/NfwWdKue9EAj
         ju7OhDvfCFuyi4QDH53ap28kaOWOfl9dEwWqVAoCPv7eSh4yByl33x7t4+sHeDLvVhGY
         6YbMHCA0Tz0hCH66tFeJvkIglFMC/lYusORpQxkP3iBVH3iB4bUWUqXYVkik50hMCBb1
         DtAQ==
X-Gm-Message-State: AOJu0Yy4fIkUXRtQZeQZLlcDXg1mG5EnC4QjHGUlvBdHa6FxiSjvu7VK
	FgKSIh1NJPXx6kBfi1OYh2c=
X-Google-Smtp-Source: AGHT+IFd6dQCn3B8wzH7CSRqASEUv2KLZebwoQpArOJDfRuQLN2exBUpc3vzblS8nwJVvP4Z+0dbxA==
X-Received: by 2002:a1c:4b18:0:b0:404:7659:ba39 with SMTP id y24-20020a1c4b18000000b004047659ba39mr10632000wma.16.1696257654545;
        Mon, 02 Oct 2023 07:40:54 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id j17-20020a5d6051000000b00326f0ca3566sm5902303wrt.50.2023.10.02.07.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:40:54 -0700 (PDT)
Date: Mon, 02 Oct 2023 16:40:47 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Mark Brown
	<broonie@kernel.org>, git@augustwikerfors.se, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Message-Id: <0SOW1S.YTFHPA95XPTN@gmail.com>
In-Reply-To: <28e38593-4861-4d61-b27d-994328ea4e82@amd.com>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
	<46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
	<4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
	<0a3feafc-b843-420a-9b04-c835f8210c1a@amd.com>
	<048d9715-9cb2-4bc0-b8b0-5e30a0db54c7@leemhuis.info>
	<28e38593-4861-4d61-b27d-994328ea4e82@amd.com>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 2. Okt 2023 um 09:20:04 -05:00:00 schrieb Mario Limonciello 
<mario.limonciello@amd.com>:
> I'm not positive, but the only way we get a full list is from Lenovo.

In order to be totally certain, yes.
But maybe the non-quirk check can be expanded to also cover (some of) 
the affected Lenovo models. As I said, I'm open to provide some 
relevant info from mine if someone tells me what "relevant info" means 
in this case.


