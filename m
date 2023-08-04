Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0FBA2C
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 22:57:34 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-522ab301692so3349901a12.2
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1691189852; x=1691794652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oufc1x89nwlrXRNKkHYYKDDdEzz4I9gpw2oNWdbuYSU=;
        b=VqYbYAYnsgurjZvk38NMRpEXWNzMIh8bClm2aLRffNd6GpxzEhY/5t2SI3RoHCFJD7
         mkyOBg8qRdLZ0bfOCH+PES2Bkjg9te6SsYX916N5I/GLY8uciRcu0rn1IupQwFsA0kai
         MHoq1pXj/0/9k7cKdBHmBgd4xSQS/J2sGDK0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691189852; x=1691794652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oufc1x89nwlrXRNKkHYYKDDdEzz4I9gpw2oNWdbuYSU=;
        b=igiGU6T0s7Fwsk4MW6ZeJlZDCyR8/sunVk/nuYD9S45OMeVy+T13N/ZdTqqxLkVUQS
         DsK8nQHsbJsjultvsjezOI82sRxR4iLal3wzczva2prk17jIXCiMbwc6cNRDZfaFe4Kc
         Nt1KbNrPruukRq78rZDT35kQwk4k2hcWlyZLxjCDOZjBzS/Nh6PGfCMU6OIRwq1MlfwV
         z/qsq8Y+oq1jBE1vz9Y9Fiyh3Zk+5KZSeUqVN/NU8EL4dT3x+/gs6oL4T4ZUuyF8PcPy
         oetKyZ+X2KYRcn82c8PBQzMyAxxLNt1TZPR9TSjNSh6ctIM1tZsWst//9iMf/gStLAwg
         I38A==
X-Gm-Message-State: AOJu0Yz0hXi4O18efxCv0rcFwmxOdiC9GxPhe6QE4miB3kRXIKCXR2y/
	FbeY9OwkFQhb9lTj4Yj+CUCbNTLtgq9j3hiaYu0Uqw==
X-Google-Smtp-Source: AGHT+IGCHF89f+PbnUektQvERrm0qcuBd8x1SnV1IA1nsRpjQK5wv3a38KsE8G833dufzf79lscz/w==
X-Received: by 2002:a05:6402:1b04:b0:523:f55:18de with SMTP id by4-20020a0564021b0400b005230f5518demr2344105edb.20.1691189852358;
        Fri, 04 Aug 2023 15:57:32 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id d12-20020aa7ce0c000000b005230724b2b1sm1850780edv.45.2023.08.04.15.57.31
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 15:57:31 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99bd1d0cf2fso360189366b.3
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 15:57:31 -0700 (PDT)
X-Received: by 2002:a05:6402:514:b0:521:d75d:ef69 with SMTP id
 m20-20020a056402051400b00521d75def69mr2790287edv.31.1691189397521; Fri, 04
 Aug 2023 15:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f>
In-Reply-To: <20230804214620.btgwhsszsd7rh6nf@f>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Aug 2023 15:49:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
Message-ID: <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, regressions@leemhuis.info, 
	bagasdotme@gmail.com, jacobly.alt@gmail.com, willy@infradead.org, 
	liam.howlett@oracle.com, david@redhat.com, peterx@redhat.com, 
	ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Jiri Slaby <jirislaby@kernel.org>, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Aug 2023 at 14:46, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I don't see it mentioned in the discussion, so at a risk of ruffling
> feathers or looking really bad I'm going to ask: is the locking of any
> use if the forking process is single-threaded? T

Sadly, we've always been able to access the mm from other processes,
so the locking is - I think - unavoidable.

And some of those "access from other processes" aren't even uncommon
or special. It's things like "ps" etc, that do it just to see the
process name and arguments.

            Linus
