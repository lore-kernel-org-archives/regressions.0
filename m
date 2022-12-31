Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C328E2
	for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 12:01:39 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id d14so3819250uak.12
        for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaaY97QCcyGMEMmi6/j1i3/RRPxl4/1opD6hoeKEX1s=;
        b=aFbcxy3jnOjz7OpodmFHVOnEAlu4wWKJSepnSVGKgdOfp0GHhD+MFuGHgg4owJzytI
         sMJntPbeZJEJsqNxwdjeUHBjRdiDN1PUo2WJkPItrzw7sbk6dZXhGbQ44nCT1kfUuw2G
         LhPD4Az6kN7MEEGKLSwo4lARBg1dbL7Az4OdcnpR5A68f1L/CFZgaOdHToUvof8AlSnV
         E1le7BiOZGIfnXbLeIL31HjAAq3drHWSfPBw3kxyz76U0BNKVsl+muuDDcz1RvpsImhu
         jFn3H8cENN47Bk40+Cfz5BGvprjdG1YrueD0GzPxjfy8iSIICJ9DN7gU1ndhiNIg945g
         EcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaaY97QCcyGMEMmi6/j1i3/RRPxl4/1opD6hoeKEX1s=;
        b=wfwG92lC4JktnkiS/F4CvKyaL/1hkeArZ1t60wnRo6WW6dV5N2L29bgNfUzOMYtob5
         50C348dYEitwRH5k9mJCVdPIanoNCzGsI2JXGNn8YwH2WomFSJ44cBqoq+FWLCvTkJun
         BRpOYpBGyvsXzjIE+fzzZGwd8S9JTPL4SD2zCB6/UqFSVk0i7MlFE1+knNR3WZhnFv3R
         4nNJFmmrjyiB4ofRoKQwubyfXb66cKzh85usPAXp1fkXcjCVJRtqwC6C3J/T1U4fI3jA
         UMd85N81CEMkPe0Xqb0UQtkt+FADZ7McHN+vl3VfPmLy17paSBJfSpy2F8J57638l3fD
         pWOA==
X-Gm-Message-State: AFqh2kr6infQwJBvKjjtyw2UfyngCW/AtmyXVPr0mF58vpp5pZynvMPj
	7vDjHkOchdl1D5Ll6NDcZ3YnKs6/kdvfMI17PDk=
X-Google-Smtp-Source: AMrXdXvKsx7afIiyOlQM/fAlfuwc8EKU3ooyXeRscS6LI85K3vl1IjQhM0xPm1vjdu9B/ewqKGwhz9dluWLXaAle0e8=
X-Received: by 2002:ab0:784f:0:b0:4e5:ad78:8523 with SMTP id
 y15-20020ab0784f000000b004e5ad788523mr2027966uaq.50.1672488097970; Sat, 31
 Dec 2022 04:01:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y66Hk6waTeXQDz1/@sol.localdomain> <20221230071551.61833-1-frank.li@vivo.com>
In-Reply-To: <20221230071551.61833-1-frank.li@vivo.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Sat, 31 Dec 2022 20:01:27 +0800
Message-ID: <CAAJw_Zs7W5yToJ0L0eB55Ch30k-E1+L_B9YHHv9LTCVhHM7LCQ@mail.gmail.com>
Subject: Re: Fwd: f2fs write error Linux v6.2
To: Yangtao Li <frank.li@vivo.com>
Cc: ebiggers@kernel.org, bagasdotme@gmail.com, chao@kernel.org, 
	jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, regressions@leemhuis.info, 
	regressions@lists.linux.dev, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2022 at 3:16 PM Yangtao Li <frank.li@vivo.com> wrote:
>
> > What happened to the f2fs developers? No response from anyone yet. Am
> > I the only one facing this? Linux-6.2 is unusable until this is fixed.
> > What can I do to help?
>
> It's been a long time since I saw Kim and Chao respond to messages. I thi=
nk
> it may be because of the holiday in the US=EF=BC=8Cand China loosened res=
trictions
> on COVID-19 (lots of people got sick, I just recovered today).
>
> BTW, the log you uploaded corresponds to which kernel git is, and which
> commit it corresponds to.

Using the latest git pull ...

commit c8451c141e07a8d05693f6c8d0e418fbb4b68bb7 (HEAD -> master,
origin/master, origin/HEAD)
Merge: 262eef26e350 0948a9ef1d59
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri Dec 30 10:47:25 2022 -0800


I just applied Chao Yu's patch and it seems to hold ..

Thank you! Happy New Year!

Jeff
