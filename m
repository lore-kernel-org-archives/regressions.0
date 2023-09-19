Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD81863B
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 13:21:47 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so94134671fa.2
        for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 06:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695129705; x=1695734505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4YCtSaeKIOsVXX/9czvJJANn7hd+Dn1kophFmS6+Ck=;
        b=fEonFMCH8zIa6UGGNM2X0tJMVDT9yJU169vzIwnx1D6Usw/TNVO0CqzU26CGBxf2lp
         R51fWSMhkPcbjzX5PaXZjgYXPFpfeYc15XSROwuABjVTVqtn1Br1JN9Fjukd81zr5zz2
         1PoFfX34r/FA7yZ4YNppLHOwXpa1Lh9dDRAOAtyBw71/3fsKVmC9pyQzVig/E5db87E+
         oOrx2BQ0QQ3DYeC3piPspfTDl8Mro7SXoyswT57XZV8X7NuLnk73Em7PQfEEGiaM6F/N
         SeeYkz75Ew40GLG7wR439V89l4PWch8qhA6y8n1phUyLPZ7yTZ94Gfd4Pu0c2xirREKN
         ndlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695129705; x=1695734505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4YCtSaeKIOsVXX/9czvJJANn7hd+Dn1kophFmS6+Ck=;
        b=ujtRFwBTTLdXHWEZxJ4L/e7yLHfQSkQ1dwMabjPTTT2V6xtlOdDdw7I1sc0f1ybdsJ
         VRbpUMsRSZX34mmf0DpIu6qi6Qtc6jwcyPWY8SszDYSbstSoN/kh1QaLdGk/le7AqsJv
         Mxk2SnM3QHMgSYGOSrs810ufjDsnkIZwaNIzBL4cZ3/MD2yV3lQX7KrwuSQ8lzHoJuF2
         7RvVDPjyc3qApDAjhXxrd5OUkTuyEPXtixLBjAVTe3uNwacvMLmvDwOepxv5BU+PSG7H
         dbz5df8MSk9R2ZURVDJrLnz8P6HwvJX/RfKI4M9akCgPfq5aJOuKuN9jZuBaQWFwt//6
         FFcw==
X-Gm-Message-State: AOJu0YxYRCR+msVeQys7oHmJwSClsLYqAVOm2JXWIX9uuF4RspZ0oubA
	SCgMVLtR4ld31oWa/gUBvJ82bRgG4122SGCbPTw=
X-Google-Smtp-Source: AGHT+IGwIDNKxuJMER6QtB2u+JbqXBdDTTB4wiUqOdzU3OsfhtVnBLn852uucjrJzC+13x+ndSD11x+lxWQaMPFY91E=
X-Received: by 2002:a2e:7308:0:b0:2be:5b09:553b with SMTP id
 o8-20020a2e7308000000b002be5b09553bmr10527479ljc.8.1695129705150; Tue, 19 Sep
 2023 06:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me> <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
 <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com>
 <CAH2r5mtUedfLSv81Z-Yb3_=AbD_QpT3tVbU1PRzMTituaw7bgA@mail.gmail.com> <CAH2r5mt6YzapEKDo=hQ64yvBn7=jwMmY1c85NOABKcMPKPp3KA@mail.gmail.com>
In-Reply-To: <CAH2r5mt6YzapEKDo=hQ64yvBn7=jwMmY1c85NOABKcMPKPp3KA@mail.gmail.com>
From: Brian Pardy <brian.pardy@gmail.com>
Date: Tue, 19 Sep 2023 09:21:33 -0400
Message-ID: <CAO+kfxQtOKoKdb+LtMeFxgu8VXa73nbmTPSfscbdwjUXM7ME_A@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Steve French <smfrench@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Paulo Alcantara <pc@manguebit.com>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <nspmangalore@gmail.com>, 
	Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 1:36=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> Does the attached patch help in your case?  It avoids starting the
> laundromat thread for IPC shares (which cuts the number of the threads
> in half for many cases) and also avoids starting them if the server
> does not support directory leases (e.g. if Samba server instead of
> Windows server).

Hello,

I applied the 0001-smb3-do-not-start-laundromat-thread-when-dir-leases-.pat=
ch
you provided against the 6.5.3 kernel.

I can confirm that it resolves this issue - no laundromat threads are
created, and the reported load average is as expected, not falsely
high.

This appears to fully fix the issue in my case.  Thank you very much!

> On Mon, Sep 18, 2023 at 10:00=E2=80=AFPM Steve French <smfrench@gmail.com=
> wrote:
> >
> > Paulo and I were discussing the laundromat thread at the SMB3.1.1 test
> > event (at SDC this week) which is now going on - will let you know
> > what we find.
> >
> > One obvious thing is that it probably isn't necessary for cases when
> > the server does not support directory leases, but we noticed another
> > problem as well.
