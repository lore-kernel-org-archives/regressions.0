Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A6028F5
	for <regressions@lists.linux.dev>; Sat,  3 Sep 2022 19:40:20 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id l6so2861967ilk.13
        for <regressions@lists.linux.dev>; Sat, 03 Sep 2022 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zR2ZxXnfIX1QMaH02rghoHmD8W0++l3H7dB1jdUZbn8=;
        b=FrCTGMDXXNos2iUNX6VLr/V4zNE5+wgG9lRpxM7Ex0J5hsqVxcZEKd5eGULvTAPzvi
         Xs1SOu31UYGvFAKPIl8Q0iFy50+h/V8+v/63Rv1Nj9lk4PI4df/PEh7AZmPzId0Z49i8
         aeSCobNvXZZRnLzs8J9TFVS8K4PdMb9517edWjZEAeeG6S20aw2IEBO34MECW1OmAFg9
         v9e4xzNwFSutY1J6kkkyWo+ndBnoNg/hUTzk8sh1F7h/QZwef3CdSeGFU54tYTDMCklW
         C5I9TPS5laMyNk5scq/ba6qzDWHSnrP1Y5sgm9oTbPzaAhBh/bnCe6yrXjRW3RAW/hdw
         p02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zR2ZxXnfIX1QMaH02rghoHmD8W0++l3H7dB1jdUZbn8=;
        b=X80Zt4aQdYE6+uBTi8aCp4mJ5cawiFM3o83T1V/dx2Z4wgE6R6ryioCK/A3ekygMZv
         gtF0hYnYZppNBCRPhyANDo/LBzLaZxNYsmpuxvciX6dXUX8rsEiRywn54tnOKEbDSJzG
         5DFl/GV/NlwLx6flQFEdxiADqZTIBqBKno+X8HgKyJYTPk91GJxBwr0Zp9GK9NC8CLTw
         3qoyKu8hGMcBH4dAS2UFiiJTmOP8eUjtwxu744TpgS2P6s1Sg5pykB7gFV5b3xa4kbB5
         59Bwfc2jA9LkDXLJKZ+PAGnzmFMKeNH35c3J6/o/cwG2jtMliOwgb/nnbBwPbZx4ZnY0
         2+RQ==
X-Gm-Message-State: ACgBeo2q6Us6JoZLZ3boE7lsM+BaYYK/GrkPEe1iV69w5qugwFbrIk7r
	knxoa6xGEbIPqkH4UxVXou7YOC/DzMIl5I4BX1s=
X-Google-Smtp-Source: AA6agR4JrnT/lwtHe/bK1hNmyByPBEoaYMxdVczJH+n1do3+h0PWbO0t/80tOmmv6Vf/EGN5PRudQ0Hcp8+R2Bf6/6Q=
X-Received: by 2002:a05:6e02:1a09:b0:2f1:47f0:d351 with SMTP id
 s9-20020a056e021a0900b002f147f0d351mr640045ild.125.1662234019807; Sat, 03 Sep
 2022 12:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com> <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
In-Reply-To: <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sat, 3 Sep 2022 21:40:09 +0200
Message-ID: <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> I don't understand why that works either. Maybe it interferes with other
> PNP0C09 devices and/or the code in drivers/acpi/ec.c.

Turns out the patch breaks sensors on a system where it should provide
output. The module gets loaded but provides no output (which should
mean the probe code is not executed). I will try to investigate
tomorrow.

> Couple of comments:
>
> - You'll need to drop __init.
> - No need or reason to rename asus_ec_sensors_platform_driver
>    to asus_ec_sensors_platform_driver_probe.
That's in order to not drop __init.

Best regards,
Eugene
