Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2972168
	for <regressions@lists.linux.dev>; Sun, 23 Jan 2022 20:11:31 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id z7so5490696ljj.4
        for <regressions@lists.linux.dev>; Sun, 23 Jan 2022 12:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aAuSW76FCl1WuSKP7vtc/an1Ea7E8ZlL23+ctJBk8p4=;
        b=f2eX4QXX0XC4GPUIKoGs+4XWYSAraFc2eY4WvbDyCJB5w66GuqIbNS9VFeYHUinww6
         Gv0xXSFuxh7Y81UBmOSK6FR+r4G/BROZ5ZuRuCHOfznCS/Ga6jfvLfyksgYqPu6qpjdg
         wLBWxrnAWzU7SRK0z/6cbXfKByKXBgMAvTHGKTRO1zNlX4rNJbIs2cu5cV38ySXi56hh
         rYtdlSCWdEkCcoql0YzUMXK+XIdRqzRkB23fX0/dDNYXLyWsURwqXx8gtQxkjQXanObb
         xRTcXkYVRSo4odAsoO9TPbJgeBLfGCswYiyUTRgjvKC4t/cUHyyQH0ogxb53nFBJQFOo
         Gs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aAuSW76FCl1WuSKP7vtc/an1Ea7E8ZlL23+ctJBk8p4=;
        b=np3SrXZoi1et266RNjJFiSNrLaxrMk0DxCPvJhkfET5QEysIULJjYlBhnY87I+jfdI
         rS4k+/Dt1IndTmdd4wVP3WM12Rvx0spdHAHDGHUXeIilNlOYmjob+ep1kebbRS2Tz1Ky
         Npm0LH9czeH7eoCqzpfu0MbN6dtzwKeHAIeJ7TPJ+Y+oL6MVodN4BNQUe+VI/Le6Jj+y
         R3Jan1GFhIEwsFQgdQpz5e4+ZmwqgXNjp7+QXylp2m/G4qNmMs82matZq//NvUzi+yj2
         h/0Vj1l2/Zn4OQNoQ3XPVKez/+zafy3rUKn+t6IO8brKXCzI0l/xn4VFJ3YSQU4KQ+Lm
         x3VA==
X-Gm-Message-State: AOAM530dnzZewXOpIGGSYYYJ1BHeurgIOPIRvTfT64oMuWb5U2M9Ndt3
	ESuiEZxTeGwzyvA1oGaXgLUXl2YeBsaFFrFsPWE=
X-Google-Smtp-Source: ABdhPJwrtieEckXwZbEL96znLSpfLom4rbY/6xPKYoIttPzuAlUPOJA0Y7Osr6LQRKqNx/8JWoeT60Umuw7akm7eOUM=
X-Received: by 2002:a2e:91cd:: with SMTP id u13mr2969610ljg.427.1642968689771;
 Sun, 23 Jan 2022 12:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJvGw+AJ5dHSb50RtJHnjbhMVQa+rJgYznFV4t-iaO0qx+W-jw@mail.gmail.com>
 <fbc36e8ebdd9222f84322d54d9114f58c225547e.camel@intel.com>
 <e3e7147e-dd4c-59a9-5dba-5ddcd2e3130f@leemhuis.info> <38b569e4-2e9f-0155-4a5c-52876e8ca38a@leemhuis.info>
 <7672718f-b34e-225d-ff53-1199026728b7@leemhuis.info>
In-Reply-To: <7672718f-b34e-225d-ff53-1199026728b7@leemhuis.info>
From: coldolt <andypalmadi@gmail.com>
Date: Sun, 23 Jan 2022 22:11:19 +0200
Message-ID: <CAJvGw+CKz_tZXKkuzrPURLJsh1JBkO1ge7V_owa0htk9pEJsZw@mail.gmail.com>
Subject: Re: [REGRESSION] Bluetooth not working on 5.15+ since "Bluetooth:
 Move shutdown callback before flushing tx and rx queue"
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "An, Tedd" <tedd.an@intel.com>, 
	"kai.heng.feng@canonical.com" <kai.heng.feng@canonical.com>, "marcel@holtmann.org" <marcel@holtmann.org>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 23, 2022 at 11:28 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Top-posting for once, to make this easy accessible to everyone.
>
> Coldolt, could you please check if this regression is still in 5.17-rc1
> or 5.16.2? I wonder if this patch fixed things:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.16.y&id=8e8cae520210139aab4b701a822bbefb13b8f007
>
> Ciao, Thorsten

Yes, that commit fixes it for me. This same issue seems to have come
up many times in the past months, it is a duplicate of

#regzbot dup-of:
https://lore.kernel.org/lkml/b0f6f66b-28aa-9d43-0aab-e6887ee0fda8@logobject.ch/
#regzbot dup-of:
https://lore.kernel.org/lkml/20211202162256.31837-1-tiwai@suse.de/
#regzbot fixed-by: 95655456e7ce
