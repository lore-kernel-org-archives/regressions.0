Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE65BA55
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 13:31:35 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id k2so30146811ejr.2
        for <regressions@lists.linux.dev>; Mon, 07 Nov 2022 05:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D8SWZqFCOUKzLi8+ZQ0qCoIDCiuOKVlNWqM0PpWG3h8=;
        b=ovVLPCEOCglehUmGcJrr8NbCmHuLM2HwzEN2pXAWbQOrIMtgNl5gNgAjLp1Cb/EgmG
         3DBhwsqKi2BCxuCazSEhqXxNG2XUAuaLslq9cnwHcE8oyaekN5dllfx5w+MshJyx0pr4
         c/1Z/uPQ7/krEoM7C/JvKKvs2x5j7DCMUAnwUEnQ3H7fyhNfJ6LIaROriISQk8ieRZBZ
         DSzQURGrk2MknD906PkmUwIL/ngtkvTs7fCj6mqOSeJ+LqyUvrxxc6iXrXkct3yAIZua
         aSNlVtYIrxmpqCLWfZKHvKjE3JYN6kSJeqjk1Bvlm72WLakxP5IAOmD2f60Z8ee6hDvJ
         TVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8SWZqFCOUKzLi8+ZQ0qCoIDCiuOKVlNWqM0PpWG3h8=;
        b=0Ki6s+YIwYbOsHd0D61xE3Z5i8BVBgpezZdlT1V49LcmMFP+/DvjL9Hv4WG5tL+d+H
         cIY4ImrAOtUh2/GdzqFAdMEfCwrWsygxJjzvRa4My+NKfdJ2Qo+Zv1WAk4NzgDw+GXVP
         hLeo2znOkg9U26Ek+L0BEpIlNljUQ3z16Ro9lCSDDGXG7NlMKYCQrWHVA/s4OHRZTnlA
         wfSEuYNLzel1QxlVIG7WGbh6dsyNvWGhg6lZPw8n9BdQPHRTHZdHEJjy5KISuBIZnBxf
         otgry4T7PhNrapQpsVacVKFIQ6U4E6EXYGC8rSo3pm2CguCwU7ypBnMIvhiWoqlOAGV9
         tAPw==
X-Gm-Message-State: ACrzQf26ynKK20bMG2Kz8b9f9cjdpAsuF33uA8zqXAN9gZg+maBFEQXz
	/NRzC7dCfG48cwibxX1BEybTJOzbuhRU5MYoLs4=
X-Google-Smtp-Source: AMsMyM7x6ErSvqffOR2ykcl9p3xOmTx5xPtBcCEP+qjONtLTT/RqTJFKC7VYg0Xi5Lbfg/OHglL+Nccr5tTNQfuCsmA=
X-Received: by 2002:a17:907:1de6:b0:7a5:ea4b:ddbb with SMTP id
 og38-20020a1709071de600b007a5ea4bddbbmr48232784ejc.757.1667827893206; Mon, 07
 Nov 2022 05:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011231207.1458541-1-lsahlber@redhat.com> <0fb9b48e-3bcc-5a5e-15fb-1d3e2752d80b@leemhuis.info>
 <b5badfe1-ccb8-f8b3-90b7-c05689e22776@leemhuis.info>
In-Reply-To: <b5badfe1-ccb8-f8b3-90b7-c05689e22776@leemhuis.info>
From: ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Mon, 7 Nov 2022 23:31:21 +1000
Message-ID: <CAN05THSLqgRS9LwQMdSBY22YRYRoD6FDJUS1HZ+Ujzk=gZ+jHw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix regression in very old smb1 mounts
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <smfrench@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-cifs <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Nov 2022 at 23:20, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 01.11.22 18:53, Thorsten Leemhuis wrote:
> > On 12.10.22 01:12, Ronnie Sahlberg wrote:
> >> BZ: 215375
> >>
> >> Fixes: 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c ("cifs: remove support for NTLM and weaker authentication algorithms")
> >> Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
> >
> > Ronnie, Steve, did this change create any trouble in 6.1 pre-releases so
> > far? If not: could you please consider submitting this change for
> > inclusion in 6.0 and 5.15, as this is a regression from the 5.15 days
> > that according to the bugzilla ticket seem to annoy some people a lot.
>
> Ronnie, Steve, if you have a minute, I would really appreciate your help
> in this matter, you are the best people to judge here.

Thanks for the reminder.  I don't think there were any issues in the
pre-release so we should try to get it into the stable kernels.
I am not sure how that process works since the patch is already in upstream.
(I have only seen the process where you flag the patch with cc-stable.)
Can you explain the process on how to flag this existing patch for backporting?


>
> Ciao, Thorsten
>
> >> ---
> >>  fs/cifs/connect.c | 11 +++++------
> >>  1 file changed, 5 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> >> index 93e59b3b36c7..c77232096c12 100644
> >> --- a/fs/cifs/connect.c
> >> +++ b/fs/cifs/connect.c
> >> @@ -3922,12 +3922,11 @@ CIFSTCon(const unsigned int xid, struct cifs_ses *ses,
> >>      pSMB->AndXCommand = 0xFF;
> >>      pSMB->Flags = cpu_to_le16(TCON_EXTENDED_SECINFO);
> >>      bcc_ptr = &pSMB->Password[0];
> >> -    if (tcon->pipe || (ses->server->sec_mode & SECMODE_USER)) {
> >> -            pSMB->PasswordLength = cpu_to_le16(1);  /* minimum */
> >> -            *bcc_ptr = 0; /* password is null byte */
> >> -            bcc_ptr++;              /* skip password */
> >> -            /* already aligned so no need to do it below */
> >> -    }
> >> +
> >> +    pSMB->PasswordLength = cpu_to_le16(1);  /* minimum */
> >> +    *bcc_ptr = 0; /* password is null byte */
> >> +    bcc_ptr++;              /* skip password */
> >> +    /* already aligned so no need to do it below */
> >>
> >>      if (ses->server->sign)
> >>              smb_buffer->Flags2 |= SMBFLG2_SECURITY_SIGNATURE;
