Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5470
	for <regressions@lists.linux.dev>; Tue,  8 Jun 2021 00:02:47 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id v8so29130559lft.8
        for <regressions@lists.linux.dev>; Mon, 07 Jun 2021 17:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1hURQgRtlvoRnwIF0Ij2NUwWoEKF6syFQ2Zerki2qs4=;
        b=HQ/3JYmQZ9GRjCRBOkfVOYleLNtc5PUBUw+vDaqlRYTiV3mX5UBsHUXxMe5sTq7FnJ
         wESo8mq9j/7eF0ybIXLjFi2BB3YUTopa0kfw/ZX+ocQIQYnLrHexdaUwWbR71JxLljaF
         3543SWgKlh9n10ClG35jTmnLXQz5+FBbSfFZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1hURQgRtlvoRnwIF0Ij2NUwWoEKF6syFQ2Zerki2qs4=;
        b=nffphlLy17TwKVEXAilYTLG8zrIdjUduzas2lhCF7q5tS1A2ANKdx/a+imkAN9YsVQ
         +FvDMczXYRJJv+AIZQpkZAFN1XYlFx6v+xYwChY98Jo9H1kmHI3G1HpL3iVRfGFc6ZyR
         a9vlq9z/YjumXd5//4xNoIg4JkB1243kDHIJ/CnvaJoa7VH28WG7+NhVWo/aSniPijtS
         D/+UQSPfeEL5JVj7rOCSiyit/aQZ3hnBi9xQoVTn30e17MNdjCUcY7m8327ECOsW4+57
         3Yz2LPNIUajAY8hfMqm9IUV7R/FQp3Ujwd4nc8RHkX2pNuRMpSvkkML8faztUFrVLm19
         YwRA==
X-Gm-Message-State: AOAM532WuMb40aRnvCmBa1I0yMHTsJWZ4pVHfIriwMwygMYnRj8fMFdW
	5rl11ZCYclxTwNxqn3n6B9eQS/v9CIC/p0uMUxU=
X-Google-Smtp-Source: ABdhPJw+ANhPqAKBxNu1GWAl4dA/auwomAVhhV2YQ+qJ4C5zGiI1QksFWYhIkhTtipmKvpfpF54g5Q==
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr10350969lfg.305.1623110565072;
        Mon, 07 Jun 2021 17:02:45 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id p18sm398738ljc.53.2021.06.07.17.02.44
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 17:02:44 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id v22so27817263lfa.3
        for <regressions@lists.linux.dev>; Mon, 07 Jun 2021 17:02:44 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr13011638lfc.201.1623110564094;
 Mon, 07 Jun 2021 17:02:44 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein> <202106071621.C11535A@keescook>
In-Reply-To: <202106071621.C11535A@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Jun 2021 17:02:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>
Message-ID: <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>
Subject: Re: Regression when writing to /proc/<pid>/attr/
To: Kees Cook <keescook@chromium.org>
Cc: Christian Brauner <christian.brauner@ubuntu.com>, regressions@lists.linux.dev, 
	Andrea Righi <andrea.righi@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 4:38 PM Kees Cook <keescook@chromium.org> wrote:
>
> I'm assuming the issue is the latter (open, drop privs, write). And
> I assume fsuid/fsgid has changed? (i.e. cred_fscmp() couldn't be used
> either?)

Hmm. Do we have some place to hide self_exec_id at open time, and then
just verify that it's still the same at IO time?

IOW, replace that f_cred comparison with a "self_exec_id has not
changed" comparison instead?

Perhaps squirrel it away in file->f_private? Or are we already using
that (didn't check)?

           Linus
