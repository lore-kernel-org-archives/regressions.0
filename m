Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADAC141
	for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 14:36:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so601045166b.2
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1692023768; x=1692628568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBDCBE7RjzqM9AaRqPKjVsz1pmTLNzetZlkAiDCCFV8=;
        b=aKolWpzf4l9+QDgsAeY0gM8tEjkEyCV+kCwYa/50PaJImWPKOa41rkaVr5azj4gr7K
         PabnzaQ0abzGvjLZ9FDR1nFhbk5ePpiH7q7KFkvpHgFLYoOyDptUGbOR/zHzeOqIU8zE
         NNcuj9Fm3jL/CvmYynDlzwx9YiY+CToyGd2z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692023768; x=1692628568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBDCBE7RjzqM9AaRqPKjVsz1pmTLNzetZlkAiDCCFV8=;
        b=IyrkN99LOVSjfoyKp9Y1l+rpXJenj11hyiqOVHRiTMv4EU8ca7XFyKqm1hoRtEqs5A
         i1h/NYZXjeAv2JaNQJXct55vPHv1og8I08ky0TQdumizU29K2BOQnVZAK7X6rYiUsLwL
         t5Oyfo0BcuTFS7hZ0PfvOY9LSPjNmXfWDyRjHgZERqPgjhu0IhmKATzcZNMDLtiJlbRD
         26V43ullhISVbRya4CQJbKz8pEErbIkzw7rRVmGF1kCGtK2V8dh4n5BVJtJo9Jrp4ugD
         ZirHESbCCECbFGxcHXcJNgkVIR7QEoBz/XB43wLyGY9gG2Fal7ZYFCIIU1HeJA7rPkGH
         fphA==
X-Gm-Message-State: AOJu0Yxjh8lTU4SOozjkAUuOmeRp2iwd+C+hKn5cRE9uCittdJyecsKU
	7oSydK/OGVvt6CW3AEpdkB9q9cXP2MLQT7s6k+ObQw==
X-Google-Smtp-Source: AGHT+IF/y/heO1ofQIbx2QpS88H0OEjtNIFBQZDYvDnoh0N/orizg8tGcrkQm20pKYRtBgIvmsFKUu2GsA5/m5ZA7Og=
X-Received: by 2002:a17:907:7883:b0:99b:e464:bf49 with SMTP id
 ku3-20020a170907788300b0099be464bf49mr8157072ejc.51.1692023767874; Mon, 14
 Aug 2023 07:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4f66cded234462964899f2a661750d6798a57ec0.camel@bitron.ch>
 <CAJfpeguG4f4S-pq+_EXHxfB63mbof-VnaOy-7a-7seWLMj_xyQ@mail.gmail.com> <ZNozdrtKgTeTaMpX@tycho.pizza>
In-Reply-To: <ZNozdrtKgTeTaMpX@tycho.pizza>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 14 Aug 2023 16:35:56 +0200
Message-ID: <CAJfpegt6x_=F=mD8LEL4AZPbfCLGQrpurhtbDN4Ew50fd2ngqQ@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: execve() fails with ETXTBSY due to async fuse_flush
To: Tycho Andersen <tycho@tycho.pizza>
Cc: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Aug 2023 at 16:00, Tycho Andersen <tycho@tycho.pizza> wrote:

> It seems like we really do need to wait here. I guess that means we
> need some kind of exit-proof wait?

Could you please recap the original problem?

Thanks,
Miklos
