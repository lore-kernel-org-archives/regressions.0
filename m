Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0012200C9
	for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6cba45eeaf6so280353b3a.1
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 08:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700497970; x=1701102770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzvBTPYKPNLAAYJofhHBHs2zDNnqaax2JRpt9QsB7iM=;
        b=uqy2TwLBOq3xG7bNk2zf6fyhRL7IAFjB0EFbMzjiH1jCyXq97eBLKOShXwas5l2Zwx
         1d0K/bPT4hOAV/+Ecxktv7OdnV+uDbiYg/DsAaZlvriWFux/ZSPUnyMO1yJSkWjA/1NB
         QrXON6Saoow0KRS3nkvuxwS9tx2rYRw9299LQsWcPARuZy+ZJnYCc36wPBhm++trWrhF
         WQnOeLjvSIhz5LX0d4u23Hh7v288GO+8azx9LUNUbq/D8gc5Cgw44YFz8ayxf6TkeWN6
         vuslMXovoap/S+S6AZM7R2hPhKG1SvoVGRuFSALnsCyuh9gaeVy/k2nl966+9OIq7Qha
         GEKQ==
X-Gm-Message-State: AOJu0YxsZnhDIML29SFrlez6hruHZvGHRcpbyrJCQ3XxpRH47Yc4BtpP
	hSw23hGHEbniCsct5LlWofxi2e7rPeOsP7buMC4=
X-Google-Smtp-Source: AGHT+IG2GolmAdfAAuerHd0wALYMQdXf2/E3bw0YDO4MyZrjW1wcH0BbupD91hhw+nZdxBAYZ+YEzNE4jRh1rw7GIz0=
X-Received: by 2002:aa7:93b0:0:b0:6cb:8347:c8b1 with SMTP id
 x16-20020aa793b0000000b006cb8347c8b1mr5083391pff.1.1700497969892; Mon, 20 Nov
 2023 08:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231112203627.34059-1-hdegoede@redhat.com>
In-Reply-To: <20231112203627.34059-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Nov 2023 17:32:37 +0100
Message-ID: <CAJZ5v0g6AHiGCB4vNLAXvH4TJRxMYpnD8LyNNnX0qEaTqr9o+Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] ACPI: video: Use acpi_device_fix_up_power_children()
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, "Owen T . Heisler" <writer@owenh.net>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-acpi@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Sun, Nov 12, 2023 at 9:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Rafael,
>
> This series fixes a regression reported in 6.6:
>
> https://lore.kernel.org/regressions/9f36fb06-64c4-4264-aaeb-4e1289e764c4@=
owenh.net/
> https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218124
>
> The reporter has confirmed that this series fixes things and
> Kai-Heng has confirmed that backlight control still works on
> the HP ZBook Fury 16 G10 for which the original
> acpi_device_fix_up_power_extended() call this replaces was added.
>
> Assuming you agree with this series, can you get it on its way
> to Linus so that it can be backported to 6.6 please ?

Both patches applied as 6.7-rc material, thanks!
