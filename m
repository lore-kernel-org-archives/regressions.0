Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2044F10E6
	for <regressions@lists.linux.dev>; Thu, 28 Jul 2022 02:27:26 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id 125so414582vsd.5
        for <regressions@lists.linux.dev>; Wed, 27 Jul 2022 19:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cZFlsUJOaADCOjobBXWN+Ry6rplJfP66zaPfTmczUmE=;
        b=XT6C+CtssjABaCZvXmadnHkws66JxdUFWFpS9Ci/f99W/0HcTl0nVrjqUaQ/YOahZH
         viPF0LtQxBhvgUqVpWoGic3U+usnS04aUEqxsPFCjRnHrc/cBYegoHrnzGTRimb17peB
         L9F0+7FeuS4ihTtFTP5sUuwy/WlWwvxHto457qIscz3b7xbIV/hqYbzS6vhdtjkmkWy2
         ca3KxotxpYdewZFlhWWK7vTKkYcIBS23UzQSurFIsw1i4IbDtcBLU+AfjoGHEjaTNtNG
         Hz8/uPV1Pf5JOXr/jZdCH3baRG2duH7NOEI3lVq6JdU+GFCNjegDLhpcLMtJRXqyKJNI
         c8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cZFlsUJOaADCOjobBXWN+Ry6rplJfP66zaPfTmczUmE=;
        b=ZdLXOeu0uInYF+X+NcOOrsauQjxm5zS/MHsmZvoOyH/L7qJpAULY5RePfOPeGiWACb
         MzORcAXZthT4k5afB1tA+45ph/22HF9zyd6kJsPULMRNuFPlIh7t9qp4trXP6YPclhtK
         xIVdj9m9eMDnTXKgdlNFHA2K2mWtJon1dKqmGeTCRGdNxTPEWRynXi54pDt9ctYVufAZ
         tUUVw/z+CNuggRJajp4xEo8UU93U8Y1f6l5CNeaVUzW4LCHAfn5R5kY1gss44MvbdCkA
         0z9Wa9fik/WV0pzfLRjMYSGYAgD2tKjqNkS3MKI4t4jtZSf3QrIfHfIdE4URvsYILWYt
         RhKQ==
X-Gm-Message-State: AJIora8MKr4FnrMjYgovxXtK3uM3NQl+Qp+8l2F7H/F2yYbL/7atX5Ms
	VX6CI4WUNRHyhPt+raFBypJbepIUH1ZazwKf+Gk=
X-Google-Smtp-Source: AGRyM1svemPRfB9LuqoREtDBGyHsaC9y38k6KATXp0QjoGbrPCj2bOAvpTi7rIqC+53WbHRV2PqRFuwflXEdY9VzgAk=
X-Received: by 2002:a67:ef07:0:b0:358:611e:9105 with SMTP id
 j7-20020a67ef07000000b00358611e9105mr5084670vsr.61.1658975244833; Wed, 27 Jul
 2022 19:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
 <fda96c5c-9007-4147-3be1-8c9deca0442c@gmail.com>
In-Reply-To: <fda96c5c-9007-4147-3be1-8c9deca0442c@gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Wed, 27 Jul 2022 21:27:13 -0500
Message-ID: <CAH2r5ms+uCF-sC1Hw6izmMhCb2jR55jB0pf8rK8OkkUh0hNGfg@mail.gmail.com>
Subject: Re: Possible regression: unable to mount CIFS 1.0 shares from older
 machines since 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c
To: Clemens Leu <clemens.leu@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Davyd McColl <davydm@gmail.com>, 
	CIFS <linux-cifs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, 
	samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"

Is using userspace tools (like Samba's "ftp like" smbclient tool) an
option to migrate these files?

On Wed, Jul 27, 2022 at 3:04 PM Clemens Leu <clemens.leu@gmail.com> wrote:
>
> Hi all
>
> Here follows now another practical reason why it is at the moment a
> quite unhappy decision to ditch the NTLM/CIFS 1.0 support entirely.
>
> I am on Kubuntu 20.04 LTS and the access to my Apple Time Capsule worked
> fine. This changed when kernel 5.15.0-41-generic was installed some time
> ago. Since then I have in dmesg the known "kernel: bad security option:
> ntlm" and "kernel: CIFS: VFS: bad security option: ntlm" messages and no
> access is possible any longer to the Time Capsule.
>
> So it looks that commit "[76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c]
> cifs: remove support for NTLM and weaker authentication algorithms" has
> completely broken my Time Capsule access.
>
> Yes, I know, ntlm is more than 20 years old and a quite insecure
> protocol. It is absolutely understandable to disable it as default.
> However, it should be also regarded that there exist companies which
> decided because of narrow-minded reasons to implement only the old SMB1
> protocol also on not so old hardware. Apple is such an example, they
> really implemented on all of their Time Capsule models (which were using
> a special Samba implementation) only the stone-age variant of SMB/NTLM.
> This is true even for the last 2013 variant which was discontinued on
> April 26, 2018. Apple could for sure support a more recent SMB version
> but they didn't do it most likely to make their own AFP3 protocol look
> and perform better.
>
> So the alternative would be AFP in my case, unfortunately it's not so
> easy. While we have thanks to Netatalk a rock-solid AFP support in Linux
> at the server side, this is unfortunately not true for the client one.
> The corresponding "afpfs-ng" (Apple Filing Protocol Library, a client
> implementation of the Apple Filing Protocol) project is unmaintained and
> dormant for years.
>
> Long story short, the current situation in this topic is as I said quite
> unhappy. While I fully agree to disable NTLM/CIFS 1.0 as default, it
> shouldn't be removed entirely. Maybe it is possible to enable it only
> for accessing older network volumes/shares while on the same time block
> the possibility to create insecure NTLM network shares? I am aware that
> the risk in enabling this old and flawed protocol will be my own
> problem. I won't complain if I get into trouble because of it. ;-)
> Unfortunately I have no alternative other than buying a new NAS or
> downgrading to an older kernel which is also not a really practical option.
>
> Whatever, many thanks for all your great work!
>


-- 
Thanks,

Steve
