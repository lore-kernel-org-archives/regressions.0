Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BA1C13
	for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 03:44:31 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b9a2033978so75071961fa.0
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692071070; x=1692675870;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExxWNL+LW7XzrZodND+dO5D7ugPfOldXXe3KWEY0aF4=;
        b=o8nbAqgu+tsuUEkjXoywwQsPd0GJ1xEiMjiU8UdSiJp+SnOFGmeUysJLF62JkaF8yT
         rcvpXKvkKpovOASx/WZNdMsZ7rRdpv5jB1bTcGnJZTcOMLdWwRILHFuxUdC/zWaTotjk
         1HnA/6HTMhtLtdYzsHHVBJJPpQ6FuN7xw7PwO4yyduqwu1hB1S+1B+I2IPxXGPn7i+rX
         nlZXr+8bPymcp8tfXw/ii8M/0b4oT3NQDYzI4tuB4r94aW+bYp2G3e5Abrz7VMz1rhf5
         1b7X5KgqTGdyhwk+xkvukslZ0m7kZc8NyHMWbOHcwx+5AdGSagnl4bRE/8OyDQnXd2O6
         rV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692071070; x=1692675870;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExxWNL+LW7XzrZodND+dO5D7ugPfOldXXe3KWEY0aF4=;
        b=N2FXANVnBl7Wai2CKXIFN8L/MgL3jcmREWThmD0U1idfLNJ+OzBwnzJcLnb0VQZKWt
         i3krc00kWTdMZIMuLW5egKZjEvYbj05G6wgLwTB68XuCg+luxG3Ud+HuLMnPC3F8xURb
         /GoVbiA0EChXtRo1PhD1NJnM/wZnGUVXK+5zrgrvPv0Osn3RYoXkorHurNtXQMxbjjel
         2CDV299KYxoa8Zd1z79oO+W8ilsG28TP8SPo8EF3gG3UCrOjGsUtIWt1rg0jfRFTF7D+
         m4rhG2hj/wGhexljU5bycIUDMf2XNnPq1QbU5z7XnkuhitsZJsakSOj2pEcQ5WZ1A4gV
         K7Lw==
X-Gm-Message-State: AOJu0Yxf13+0tK950+uGTPLNhiBR2J8y7d18EMJnnv+kYH1BxE/yFfUq
	uvhrJaFcyh+Rynx740k+n6L0ANZvSbRtn4wqXAo=
X-Google-Smtp-Source: AGHT+IFgAyh9D6DMTdhSO6edBWp8xyryII/Mu1ztl6UbMz9eaIR9w9sl15mXEUaXtIVLI7GPSUxj5rJuMoWUUY99riw=
X-Received: by 2002:a2e:2c09:0:b0:2b9:c046:8617 with SMTP id
 s9-20020a2e2c09000000b002b9c0468617mr7719912ljs.5.1692071069534; Mon, 14 Aug
 2023 20:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+prNOpqd2Tk1tiBAa9MT6ZPxB5gj9ftxOhaZ-u1WEay9H-oHQ@mail.gmail.com>
In-Reply-To: <CA+prNOpqd2Tk1tiBAa9MT6ZPxB5gj9ftxOhaZ-u1WEay9H-oHQ@mail.gmail.com>
From: Xuancong Wang <xuancong84@gmail.com>
Date: Tue, 15 Aug 2023 11:44:19 +0800
Message-ID: <CA+prNOot8qCAws94CuFL7LqDRYk8jbHb=EWFuSQ9yDzJSy0VFw@mail.gmail.com>
Subject: A small bug in file access control that all have neglected
To: security@kernel.org, stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear all,

I found in all versions of Linux (at least for kernel version 4/5/6),
the following bug exists:
When a user is granted full access to a file of which he is not the
owner, he can read/write/delete the file, but cannot "change only its
last modification date". In particular, `touch -m` fails and Python's
`os.utime()` also fails with "Operation not permitted", but `touch`
without -m works.

This applies to both FACL extended permission as well as basic Linux
file permission.

Thank you for fixing this in the future!

Cheers,
Xuancong
