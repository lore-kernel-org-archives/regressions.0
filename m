Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887CE6110
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 23:46:36 +0000 (UTC)
Received: from 003.lax.mailroute.net (003.lax.mailroute.net [199.89.1.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by 011.lax.mailroute.net (Postfix) with ESMTPS id 4Mtkhr29RPz2lHwN
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 23:44:28 +0000 (UTC)
Received: from localhost (003.lax.mailroute.net [127.0.0.1])
	by 003.lax.mailroute.net (Postfix) with ESMTP id 4Mtkhh6m5Jz1spkh
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 23:44:20 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 003.lax.mailroute.net ([199.89.1.6])
	by localhost (003.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
	with LMTP id gHWqrkIYakv1 for <regressions@lists.linux.dev>;
	Thu, 20 Oct 2022 23:44:20 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by 003.lax.mailroute.net (Postfix) with ESMTPS id 4Mtkhh1QSJz1spkf
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 23:44:20 +0000 (UTC)
Received: by mail-pg1-f199.google.com with SMTP id k64-20020a638443000000b004620970e0dbso454184pgd.6
        for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 16:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.net; s=googled;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YX1dOQSRsve78QezUb/eXdj5VKCyEMPTdvcMB3RYrOQ=;
        b=WbIhvWU8CfHx8GVDZGCjoiNp8HwXpcmXBtrDYeXkgwCxun52M4sXTAU7fvjDWmQIDa
         m14lf2Dkr9vaxUNBrV1dEzQyAjrofbS6nbkuPY5HluitUiRVsA2qCA63DDZQAz1pnhcb
         9iZhdMitQh2kG5RWefsNKLOf+SolbgeiSnXrS0C/is8Ow+7OT2IKl2kPTbFABWHB3Zj8
         m4OfxPhnXDMPtRJCcRHwL0c7694ItA0+ePqTw9SoCgg9RHlgnrw58FPqMZL0VrC+5tMf
         ssP3zJa8OvnvQndg9B9LLvvpYWX/dCw8asU4LC2qxWe+v8RTas2J7rREyzqEQLYiMJ7C
         rJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX1dOQSRsve78QezUb/eXdj5VKCyEMPTdvcMB3RYrOQ=;
        b=mVoAtV594AXGdOo10XNqVdfA0VkRrIP9B2qetfIXNxwi34AuOzpxEcZbOaIimtO3ai
         B7SqoOcWR5N9HmX6Mt9Jm/OyHQav4PXA+B9Dnc/q5scHOYsR2WDmBviUbTh/CFisCQQG
         I+rB1XKYNz/Hy/O69FXzLPIX/zGn/VHvRrDnJ8XBq6VBPIfXn2ujdpp9+pDnc5lo3z0G
         QgHNRWsz7Xz5AhVKj9IvREcTZwW1uCu838L8qYL7GmQk+C6R31OpuvXCU7w5bI7/vHL+
         rWihazIchE3MWXf0Cy6TTcdkZpa/um15grQG1FuWbLEnzp8BeWm8BNV5tUbRk7/QeHvW
         Gt/Q==
X-Gm-Message-State: ACrzQf07uKNY3D3AogNT+kmD2gGfPCnF/+pByFRgdrmJ5hLb5VRSMsmT
	xgaCCmNuLR675F/FRgmhEP54yHkU4VbRKVx0Me/8NHVTq2pEhh3B9Nc5sC1sVu6REH7oIF9zPcn
	k4iCz6xgWbAG5U4XKJbRgh0eeO5qbWonIpyEW9YhwrZ8lkEB2LbAEIA==
X-Received: by 2002:a63:df03:0:b0:462:cfa2:2871 with SMTP id u3-20020a63df03000000b00462cfa22871mr13685281pgg.225.1666309459076;
        Thu, 20 Oct 2022 16:44:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM75NxUHYbQaS3LgwG5b/WXaDO1a4BYysaF3eePJ2McKsaOhV8OIsrv2zZdZ2WzF6btIac6cwDHaWtY7Ngc0h+A=
X-Received: by 2002:a63:df03:0:b0:462:cfa2:2871 with SMTP id
 u3-20020a63df03000000b00462cfa22871mr13685264pgg.225.1666309458800; Thu, 20
 Oct 2022 16:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221018174157.1897-1-phillip@squashfs.org.uk>
 <20221020135545.586-1-nicememory@gmail.com> <41ef4b22-eea8-2d67-99d8-6aaae7d25ac1@squashfs.org.uk>
 <02b72b86-7240-5530-477a-c8bdcfd35ef5@gmail.com>
In-Reply-To: <02b72b86-7240-5530-477a-c8bdcfd35ef5@gmail.com>
From: Slade Watkins <srw@sladewatkins.net>
Date: Thu, 20 Oct 2022 19:44:07 -0400
Message-ID: <CA+pv=HO36vMH6Uqu412MF+Hmu-+57QeapGt6k+QDDxr-AsbJkw@mail.gmail.com>
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, Jintao Yin <nicememory@gmail.com>, hsinyi@chromium.org, 
	linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com, 
	mirsad.todorovac@alu.unizg.hr, regressions@leemhuis.info, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[Resend due to formatting issue, thanks gmail.]

On Thu, Oct 20, 2022 at 7:23 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Ah! I was about to test his third fixup patch. I prefer to go
> with your fix instead (as the formal patch).

+1, agreed.

-srw
