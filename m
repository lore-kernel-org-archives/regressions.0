Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2D7612F
	for <regressions@lists.linux.dev>; Wed, 12 Oct 2022 22:58:55 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id m6so399681pfb.0
        for <regressions@lists.linux.dev>; Wed, 12 Oct 2022 15:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.net; s=googled;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DgFJeIB3oP3W9drjP/6hWGHdibrVVW8+X4R918qIIwk=;
        b=X70KMAJy64U1sXNf0RXVAKW4S2O5hXzQECXnQoyY5yG7kv/DjNxYhewiS7sjIUmlNz
         0vJMfNzYrtyuyRsDKSBePhLProotbrRTT9BRx4zIV52sybSWD63f9ZEEcpjbCi3V8fwC
         ppZTarKngWbtia4HnLYruIVaYfgwIkkJLjWg8gv1bSZx9C/8eQvNXUkmHR2uDuMHXXpY
         fJvqHvfNUjysC6a1Wu6Wn24GYc38FBSFz5qMp4VTDXnjvL8o40Eqv4fqcsL8Z6rCHXlK
         jor76a+/Wha2wsTcqz3h6USRRZiUw4Hz2fG6WPMhx+MVGvgoNojm8jQxdeNjBTGctjG5
         zC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgFJeIB3oP3W9drjP/6hWGHdibrVVW8+X4R918qIIwk=;
        b=JfP/ewgZDyXy4bio1An75vZnRRGJRsQ8ON6aYl4nqdAS2Q0LU3Ai6+RICFBfLW51jR
         JbdMYjQDsO9YbxLXuldSKgRa8Z4g6PbgQ9xcgflvB4rdf/2tJogpNo819mypoOTypd50
         gWuw4ZufBc5uu0MnlWqf2BxF0lxx9WFHrmZ0gPPiljgsRBoDkYNcT9dmfYSQAe7nMRde
         opsSj3eAUZx3vp2vmyolTEHqg6pFQ/KrMJ2Kj03zGmo6fMHuD4rmBid+gn6XurUx10BD
         wchosLXzWecfDkUxBhzH6LGfYngNfMX2e/6ObzBmXrL+DfR39TlwPd2zuTHNC1UOV4+l
         ykig==
X-Gm-Message-State: ACrzQf2f3osnv+fgsZqSbrAaSnVREWPiYCwzmgNOpHHN+zuOLrxEe06L
	+5BNE+Wq/UpHcmY6/V10/9EroM67fGH3h0l4PDekIA==
X-Google-Smtp-Source: AMsMyM73mFIuAyRMpEQSPGuVITrQOYzUtmHsyTs/Aw33fg4i3Z2LR7QtB80pmVxD03dZ6LO9V/zUSjA6uKJuxVYt/hA=
X-Received: by 2002:a63:444f:0:b0:464:3985:3c92 with SMTP id
 t15-20020a63444f000000b0046439853c92mr10364342pgk.412.1665615534822; Wed, 12
 Oct 2022 15:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr>
 <5bb75cbc-a0db-537b-12d0-889230c865d8@leemhuis.info> <0fb2a9ff-df76-8af9-e54a-c2dc6bfd9478@leemhuis.info>
 <bdab45d3-c893-42ff-dbb9-5fa93d0dff55@alu.unizg.hr> <dd62210d-d095-f971-2b7b-0ec54fd189a9@leemhuis.info>
 <c05134cc-92fa-dac2-e738-cf6fae194521@alu.unizg.hr> <6ba15505-1c04-df2b-237f-b3060f26d2e6@leemhuis.info>
 <25cd0e21-ed8e-1836-b0ec-c052c2276cd8@alu.unizg.hr> <c40786ab-8b3b-9b64-683f-dac589c024df@alu.unizg.hr>
 <e335e7cd-366f-7ced-2707-b6ef49cfe9eb@alu.unizg.hr>
In-Reply-To: <e335e7cd-366f-7ced-2707-b6ef49cfe9eb@alu.unizg.hr>
From: Slade Watkins <srw@sladewatkins.net>
Date: Wed, 12 Oct 2022 18:58:43 -0400
Message-ID: <CA+pv=HMSw6iG0y3GWsfjXvBG66K6tkGVzoSmx34_=fAof2fgXg@mail.gmail.com>
Subject: Re: BUG reproduced: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, linux-kernel@vger.kernel.org, 
	Marc Miltenberger <marcmiltenberger@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 12, 2022 at 2:05 AM Mirsad Todorovac
<mirsad.todorovac@alu.unizg.hr> wrote:
>
> However, I haven't yet done informing the Ubuntu developers.
>
> I will try to do that later today.

Please let me know once you do!

Thanks,
-srw
