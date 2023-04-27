Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737333D9
	for <regressions@lists.linux.dev>; Thu, 27 Apr 2023 15:13:00 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-506bf4cbecbso12812361a12.1
        for <regressions@lists.linux.dev>; Thu, 27 Apr 2023 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682608378; x=1685200378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tnBlwR2KgjIrpyr1ey4GRZA/jG9gwGR13N6cjFqMs0=;
        b=bSrog62jbFIHegWWinV0uhRveHaKvrAVwwmy7btQ3UI2pm0bfvatEXm2BWcZIsKLsh
         hYvYoxRPmyMIgb65VXeGZgkiJVhqAekWarXezb/A10WfhGJcKUgNikI/kajpyvnJsIWH
         VDWqu1Y3wJikK71b9jaX7SdlJFKw0axUNoan4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682608378; x=1685200378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tnBlwR2KgjIrpyr1ey4GRZA/jG9gwGR13N6cjFqMs0=;
        b=ik+TgO+W+gr09iqVfqqA0VhTnB3o4bz2fmKYngnDOt4EDbs5vj96mLQvrJh2mivM2A
         V2mV4gleGWAA5lar8Zp80WH2FuQ+bcu5VecXKMYBb7Z9rP4zvdIjyusjXQ+tuSUhILew
         TfL7+LyhzW26p0XttucxxpwfYwqcPF3nARrq83okM0SJRaCyls/0kktTNENKOxhLq05/
         fjqt1c51knlXUhIn0GyV3YtNDAfCy1YH5Silb/JaYM7bZAoofsjpDE6dbgmhJvRxAcfX
         PxyXdp6U7JkNg4XSyL/YS0dBm1T/1ltATZL3Fg6C5yx8zSKwwXZLiCFSafTQT29GwEv8
         MQEQ==
X-Gm-Message-State: AC+VfDw3AroQNySSRfWtUoGVt3lC3jO7W6p0JcIi13T0vsnbCQeXZWaE
	aLLQ/2ADAcpF3/ntRC4Ltf0bfVRWut4E9Vt2m4h0DQ==
X-Google-Smtp-Source: ACHHUZ5WyUk+qXUfpQM8ADHxdVNXVmD/9N06PaNWYN4aWAC5fJR8ridl/8fSeeArockzYC7bueQvJg==
X-Received: by 2002:a17:907:78c:b0:94e:cd53:21f with SMTP id xd12-20020a170907078c00b0094ecd53021fmr1990977ejb.64.1682608378510;
        Thu, 27 Apr 2023 08:12:58 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id y21-20020a17090614d500b0094b87711c9fsm9812559ejc.99.2023.04.27.08.12.57
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 08:12:57 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-504efe702d5so12828427a12.3
        for <regressions@lists.linux.dev>; Thu, 27 Apr 2023 08:12:57 -0700 (PDT)
X-Received: by 2002:aa7:c946:0:b0:508:3b23:d84c with SMTP id
 h6-20020aa7c946000000b005083b23d84cmr1902412edt.1.1682608377021; Thu, 27 Apr
 2023 08:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230427140959.27655-1-vbabka@suse.cz> <2023042719-stratus-pavestone-505e@gregkh>
 <3cc6e10c-f054-a30a-bf87-966098ccb7bf@suse.cz>
In-Reply-To: <3cc6e10c-f054-a30a-bf87-966098ccb7bf@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Apr 2023 08:12:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdGzy6-3jzN6Kvtz1QxStTZBZPz1zy9i4gM9nbe5FGbA@mail.gmail.com>
Message-ID: <CAHk-=wgdGzy6-3jzN6Kvtz1QxStTZBZPz1zy9i4gM9nbe5FGbA@mail.gmail.com>
Subject: Re: [PATCH for v6.3 regression] mm/mremap: fix vm_pgoff in
 vma_merge() case 3
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, lstoakes@gmail.com, regressions@lists.linux.dev, 
	linux-mm@kvack.org, patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jiri Slaby <jirislaby@kernel.org>, Fabian Vogt <fvogt@suse.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 7:39=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> Sorry, I wasn't clear what I meant here. I didn't intend to bypass that
> stable rule that I'm aware of, just that it might be desirable to get thi=
s
> fix to Linus's tree faster so that stable tree can also take it soon.

Ack. It's in my tree as commit 7e7757876f25 right now (not pushed out
yet, will do the usual build tests and look around for other things
pending).

                 Linus
