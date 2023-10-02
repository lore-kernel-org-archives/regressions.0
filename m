Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C09168AC
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 13:00:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3248e90f032so4014053f8f.1
        for <regressions@lists.linux.dev>; Mon, 02 Oct 2023 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696251650; x=1696856450; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovbV2eys6IIdOiXHS9kD3zODjwel8FxTC6gNW0c8hfc=;
        b=fLpDPg2aDb0rokLJXKaRtwZsbVWaivhyD1Qttw3fKsTSmU6PW+UZvZyBeohgHPItxm
         Z+pGH+FJFnQ6lTR/h35EBawGWEKzBVG5Y7HbGXaS0cHj5VShGF1wm79c7hjdrcmETibZ
         se2tqI/bxU7KFxZ5jcHspAOzBRrzJ5hYBEfg5LHh56gTmPG/k8/Ioi7nmPbkyo/4YbzG
         UeOzwiApEtmPiHSAUQbDq63cBdERLSbpjogMJBjT2dLEsalz5Xk4KCNo4c7naNryPKx8
         vMjaFzqVLs5OwUj2+s9K91ny44c9btySrr9pH5UHaoV66C28CP6zfVC3MZ4EAwrk8ybn
         /Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696251650; x=1696856450;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovbV2eys6IIdOiXHS9kD3zODjwel8FxTC6gNW0c8hfc=;
        b=mejMCnh25IpZTidpVO28IZz1DvBNa63+T2KL2+jsqhkbMLtWerFVgQoKewhBz1nk6/
         CZehDmbNRj7YoRNPZdFKZEkw5SFtksAvgX5EZS7yQaLK0XwtSnrV6vv3dLIevIZ/uiBB
         OBtb47Ix0iwo9NevZWYa9vNY+PV1gK0MJtKnqlFV9dQlKdCECishPtT0/YNCOiDDKzhy
         hZQTBTtG9qS80zdSDVQvsxwEYa0dHz8iCeL4jieFTU76WcmUoK8LeUm+tuPAY0Hxh075
         G8+O1JkUnMG9BK+Vd99WmThmGhxu9dAvtSsOZBCD5MhFO84DIYi1K8RCJg350XrXsyq5
         Z4+A==
X-Gm-Message-State: AOJu0YyCdiegbTaRpqTkf6+IEECDUv1DL6sDGVU7nTq54A3D2clYsanb
	nxnh0D6gCUZz14zrxO7RiTs=
X-Google-Smtp-Source: AGHT+IGsS0ybABVU0gSlvh634b7lSev/pAic38BOQT0jBO2o4HznWacSqgb/YE8IgpbdE5p0M3B43g==
X-Received: by 2002:a05:6000:18c9:b0:319:62e0:f2fe with SMTP id w9-20020a05600018c900b0031962e0f2femr9647539wrq.36.1696251649490;
        Mon, 02 Oct 2023 06:00:49 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe7c9000000b003197efd1e7bsm14065942wrn.114.2023.10.02.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 06:00:49 -0700 (PDT)
Date: Mon, 02 Oct 2023 15:00:42 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Mark Brown <broonie@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	mario.limonciello@amd.com, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Takashi Iwai
	<tiwai@suse.com>
Message-Id: <65KW1S.A6C8VBV29YCM@gmail.com>
In-Reply-To: <64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
	<46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
	<4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
	<541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
	<64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 2. Okt 2023 um 13:54:59 +01:00:00 schrieb Mark Brown 
<broonie@kernel.org>:
> Until someone tests or otherwise provides specific information on a
> given machine we're just guessing about how it's wired up.

What specific information are we talking about here? I have the 82YM in 
front of me and could help investigate.


