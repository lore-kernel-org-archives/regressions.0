Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEC2168AC
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 13:17:42 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-323168869daso13751810f8f.2
        for <regressions@lists.linux.dev>; Mon, 02 Oct 2023 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696252661; x=1696857461; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z+g2r1MHpKADoUhttLvqNozABTTCpwn69LleV+mBSZw=;
        b=dQq2zkU7HNfjv7onNczsazRY455nMUuSZOdsme3hP/N+qrupvUcgnDLCu0TmEfCGeY
         kRB7DtYtxkgZn0dv0hub9ONVluF07xlHNVCyJIGBBN3XHxOyUUsNQZiEb6XXsKkufvoS
         aGvoQ+iFedWWpuNZJWDrr8Xb+zJbBPbBZf1xMnTftR5u3jvKWUNnJkisiY1QpUf8908z
         0qeJksgLFkEmqTPuwHJemxpHgpb+pDJKCBQAB9BEV8rcPYREKXaz2Sy3YNTsUq21XYMu
         lk8CEs9a8L+9UG+Op9OSERBXWIInE3Hv52b2gnZPvhLylrmlQfmtnDgDXOly/5RwI666
         zmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696252661; x=1696857461;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+g2r1MHpKADoUhttLvqNozABTTCpwn69LleV+mBSZw=;
        b=DuEr0MLAi6Nskwya2obeU4tABQXVaBNrTJ2iGM79vVoelCy2+IAihjAPKr5VB3TPm3
         GRYwRBuZPQQzb3po4vzojMX8ePAMuK2u6diUTX2L8vqxVvNwcnEDGY7YKG2/d7r4hyWc
         oM/kMkikeDlc8Z8AZDueEQHMQY7OA+IM5ATPSXeTgHCl4J61t/E48Zk5nr8Xiqk69Tz/
         RxmG9rFhzcWufVfyNL/rjzWcjsZYY2a838uTauN8tFP88Zj7l4vFNPLtxg6q5+cwUHQT
         FpO6+0oeUFKVfnU0XcnCCUJCQJttg8sllXWxtGr1eq0iyCwlRc6Ks20bhFWIjfBn4eK7
         wjlQ==
X-Gm-Message-State: AOJu0YyUzSQxxV/wkKFLT1sPfABIYkzW+YcaLhRMz4WHrMB9kHVTOsTo
	cFDyQhk3gO8bIW/Uc6TX2PmjFZjeKXE4cg==
X-Google-Smtp-Source: AGHT+IGeZQu02JzP/Nlg3C7p7vx5VY6jCwGLZ0tAXK3iajF+JbhjNs9qkMjRAcg7uKIaJxyg3RvqMA==
X-Received: by 2002:adf:ec47:0:b0:313:dee2:e052 with SMTP id w7-20020adfec47000000b00313dee2e052mr9195032wrn.26.1696252660381;
        Mon, 02 Oct 2023 06:17:40 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id t11-20020a5d42cb000000b0031431fb40fasm6907727wrr.89.2023.10.02.06.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 06:17:40 -0700 (PDT)
Date: Mon, 02 Oct 2023 15:17:33 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Mark Brown <broonie@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	mario.limonciello@amd.com, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Takashi Iwai
	<tiwai@suse.com>
Message-Id: <9XKW1S.IRRCIDM08XWX1@gmail.com>
In-Reply-To: <89698b5f-a616-4f49-802a-21326a868c7f@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
	<46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
	<4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
	<541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
	<64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
	<65KW1S.A6C8VBV29YCM@gmail.com>
	<89698b5f-a616-4f49-802a-21326a868c7f@sirena.org.uk>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed



>>  > Until someone tests or otherwise provides specific information on 
>> a
>>  > given machine we're just guessing about how it's wired up.
> 
>>  What specific information are we talking about here? I have the 
>> 82YM in
>>  front of me and could help investigate.
> 
> We need to know what magic set of quirks makes the thing work.  Are 
> you
> saying that your patch doesn't actually do that?

It does.

Maybe the non-quirk check (ll. 395-403, seems to be using ACPI) is too 
specific? But I'm a bit out of my depth here, so I can't investigate 
that by myself.


