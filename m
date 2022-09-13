Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2373C10
	for <regressions@lists.linux.dev>; Tue, 13 Sep 2022 15:20:42 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id a14so4458401uat.13
        for <regressions@lists.linux.dev>; Tue, 13 Sep 2022 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foxdogstudios-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oK2fqA+eJKlumJ2qthC6U57tIYT5sBlUkTZFBDaw+Xk=;
        b=HAzIwEgoJAormss7IKkQ2Qwbhm2SIl+Y9QWUlEEieDsvbYZXn6VWIbxaQGw906iMU+
         8Ip8PntZ8Pb/dx27QWf4RUx5YkLlgYk+U/m4gdZXXxat6y3MzKFyUYpOnZoIyyAYcpsp
         BRX09IIVkaudWHHEDRn4jHYpkwqY94OBLceFJlnA41Yp30vCui+u7cc8Q4TvoQbfqfnz
         YB40h0wos7bwjhoALTYLWoxX5tjFnvkJFwURFd/M5vcwpGPQSJOncG6ysgknRgkZke8F
         eKExiMV2PdiJIyto7p1lNqXd02cQXlEyF3CcaczX8Jsf70LqPYEWtTZXY4+rTn+xjzrS
         4Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oK2fqA+eJKlumJ2qthC6U57tIYT5sBlUkTZFBDaw+Xk=;
        b=jPxWo/Xp48AaUQ1vpn6SVA+ropgCp6RGuzsZ64vBL12xS+0ymh4YqAElhANYRe8FQy
         Qn9I+Zxa5V0W6aoZ0CND5K3por/DfEAuHeLVY3Evs9Ggx91BdTHYbfzsqdp85qpzHcR1
         mjw/3mzxD4d4+BhR47SBwLjFcJYASS5Ic3TIvnpPeHyNuMOelp40VwGANhpxAgqNw3KA
         VlTOLxW6G6S1es3jvBM4hJjcreZNXs5n9BJ0UgUxzG5cYvyK5EwiIxE3Ifh4nNAjYTFt
         NlBbvT4zUD5qpcsqMzvVO+Zk4Q8opNw2PXfG2goUQX7qQ7jvT40WjkvluLXh4L0j/+yr
         7kng==
X-Gm-Message-State: ACgBeo16jHK8OJG+Jqw/aJRTOqZ65GrsBk0WWNAmRXZZHX5VY5vwCxqa
	ywSd3ICk+MaWafoxV7SevLEDl/3gtHrrnRWuwK55fw==
X-Google-Smtp-Source: AA6agR6NY/3UU9zrqaNS5yAb0QpJicAq5lXoS0luByiv4kIrxPAThnRhcDbDQMuE+smHtJXkUEbuVgZ8dmDyoBs8q6I=
X-Received: by 2002:a05:6130:1102:b0:38c:49b4:bbc3 with SMTP id
 ce2-20020a056130110200b0038c49b4bbc3mr11332022uab.107.1663082441639; Tue, 13
 Sep 2022 08:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD+dNTsbuU4w+Y_P7o+VEN7BYCAbZuwZx2+tH+OTzCdcZF82YA@mail.gmail.com>
 <24e95c8b-dc05-0d00-50bb-58b71c5baf94@molgen.mpg.de> <CAD+dNTuRThoa2OSzQ27tENB29GJ4oD0j3D+P4k42HzopEeTJMw@mail.gmail.com>
 <CAD+dNTsqBEjzG7BinKtxveH9faJqss89WPufbSsaB5FZRDgOPA@mail.gmail.com>
 <ef7a1421-06c5-f3b7-8c7f-7fdfd7862c96@molgen.mpg.de> <e7c8127a-d561-3a3d-f208-770f3abbee17@leemhuis.info>
In-Reply-To: <e7c8127a-d561-3a3d-f208-770f3abbee17@leemhuis.info>
From: Peter Sutton <peter@foxdogstudios.com>
Date: Tue, 13 Sep 2022 16:20:30 +0100
Message-ID: <CAD+dNTsnVpyFKyZcAgnqAZz-e2upjFd3NGWV=hPhywL8k0g6Nw@mail.gmail.com>
Subject: Re: [Bug] [Deadlock] Kernel thread deadlock in rfcomm socket release
 when connect interrupted
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, 
	Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>  a fix for a deadlock for RFCOMM sk state change was posted last year already:
>
> https://lore.kernel.org/all/20211004180734.434511-1-desmondcheongzx@gmail.com/
>
> It seems it never went anywhere, unless I'm missing something. Is that
> maybe the same problem or somehow related?

I mentioned this on the Arch Linux Matrix channel. The `linux` package
maintainer said they had encountered the same and added the linked
patch to the Arch Linux kernel package but removed it because it
wasn't merged (which explains why my issue went way then came back).
Anyway, we compiled a 5.19.8 `linux` package with the patch (which
fixes my issue) and they said they'll add the patch back to the linux
package.
