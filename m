Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FA47E
	for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 19:32:02 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9936b3d0286so426399166b.0
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694892721; x=1695497521; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4tSANpdPZtQ5moNLopTdGJ5bxa+NmMhHjATNkQUyBj8=;
        b=X6YwsoIOynB2rSsK/5+YywNCBGPtK8yc5Fq3f0QV1VaTu40wMXpzZuL8pT4VC0k+8S
         avzuMESs1/qDG44xI8vqh7G284RfxVzlzS+ALp+wb3105USmVujw7TyFg9swA9eYGklP
         LnmBitPyTHpzmkMAGy700JwfBACGfy9x2Vcfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694892721; x=1695497521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tSANpdPZtQ5moNLopTdGJ5bxa+NmMhHjATNkQUyBj8=;
        b=gqENTBUUeYXkhbYlKaDriIpZxvmBaXzV7uPw4EJp7hCyxFb1qAUk8XlyNtUQI5vaEz
         svrLTzc3t5HBpIcx7bD8AXmU2Wq7ffO4trmeHMex2XheFrjvLE/OI24i70sF3BhQ9XwL
         vs0Q0sELERpGDo8u+83ocNX+T49RQqBLgc6R1bqBnhQEY2eWQj8IUahS6QqSMxLZkIEt
         mCWA4WaFEhChklcWVFS3Lpye7sYtWhHBG37n7gT3XpM3DSfK7sZVo1qA6OnLDSHhMYx+
         hVLjwqvZaPLRLZfw7zVj+5+UXEnbUKqVx7FWxLavlc1Z5UM7okwYeoOFaToc/nJ0b5ns
         e5uQ==
X-Gm-Message-State: AOJu0Yz/HKxmup5uwhv9Xd2P8ksMfgYDAwILXjKVAqOCp1QMcRvTs5V+
	TrdaFDguJ45RCkEwAzSicKRH8Afziv6EWZF/JCW84vE8
X-Google-Smtp-Source: AGHT+IEtCnoLAUDlhNpgGiGaYqa9IA5QcsTyTbLvbbDy2RFhWUyTvZZ4Y8+GAFD3qOYDbfwzb2HtVw==
X-Received: by 2002:a17:906:53c4:b0:9ad:a660:95b2 with SMTP id p4-20020a17090653c400b009ada66095b2mr4553277ejo.11.1694892720793;
        Sat, 16 Sep 2023 12:32:00 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id jp27-20020a170906f75b00b0099bd046170fsm4084594ejb.104.2023.09.16.12.31.59
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 12:31:59 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-530c9980556so695366a12.2
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 12:31:59 -0700 (PDT)
X-Received: by 2002:a05:6402:229a:b0:530:a19b:175 with SMTP id
 cw26-20020a056402229a00b00530a19b0175mr3639630edb.2.1694892719344; Sat, 16
 Sep 2023 12:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1694366957@msgid.manchmal.in-ulm.de> <ZQWUzwiKWLk79qbp@debian.me>
In-Reply-To: <ZQWUzwiKWLk79qbp@debian.me>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 16 Sep 2023 12:31:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
Message-ID: <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
To: Bagas Sanjaya <bagasdotme@gmail.com>, Michael Labiuk <michael.labiuk@virtuozzo.com>, 
	Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc: Linux PARISC <linux-parisc@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: multipart/mixed; boundary="000000000000783fdf06057ef6ee"

--000000000000783fdf06057ef6ee
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Sept 2023 at 04:43, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Thanks for the regression report. Michael had already bisected it [1], so
> telling regzbot:
>
> #regzbot ^introduced: 408579cd627a15
> #regzbot title: huge committed memory due to returning 0 on do_vmi_align_mmunmap() success
>
> [1]: https://lore.kernel.org/linux-parisc/30f16b4f-a2fa-fc42-fe6e-abad01c3f794@virtuozzo.com/

Funky. That commit isn't actually supposed to change anything, and the
only locking change was because it incorrectly ended up doing the
unlock a bit too early (before it did a validate_mm() - fixed in
commit b5641a5d8b8b ("mm: don't do validate_mm() unnecessarily and
without mmap locking").

HOWEVER.

Now that I look at it again, I note this change in move_vma().

-       if (do_vmi_munmap(&vmi, mm, old_addr, old_len, uf_unmap, false) < 0) {
+       if (!do_vmi_munmap(&vmi, mm, old_addr, old_len, uf_unmap, false)) {

and I think that is wrong.

The return value that changed was the old "return 1 if successful
_and_ lock downgraded".

Now it does "lock is always released on success if requested". So the
special "1" return went away, but the failure case didn't change.

So that change to "move_vma()" seems to be bogus. It used to do "if
failed". Now it does "if success".

Does the attached patch fix the problem?

Liam - or am I just crazy? That return value check change really looks
bogus to me, but it looks *so* bogus that it makes me think I'm
missing something.

                       Linus

--000000000000783fdf06057ef6ee
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lmmf85c00>
X-Attachment-Id: f_lmmf85c00

IG1tL21yZW1hcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbXJlbWFwLmMgYi9tbS9tcmVtYXAuYwppbmRleCAw
NTY0NzhjMTA2ZWUuLjM4MmU4MWMzM2ZjNCAxMDA2NDQKLS0tIGEvbW0vbXJlbWFwLmMKKysrIGIv
bW0vbXJlbWFwLmMKQEAgLTcxNSw3ICs3MTUsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBtb3Zl
X3ZtYShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAl9CiAKIAl2bWFfaXRlcl9pbml0KCZ2
bWksIG1tLCBvbGRfYWRkcik7Ci0JaWYgKCFkb192bWlfbXVubWFwKCZ2bWksIG1tLCBvbGRfYWRk
ciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSkgeworCWlmIChkb192bWlfbXVubWFwKCZ2bWks
IG1tLCBvbGRfYWRkciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSA8IDApIHsKIAkJLyogT09N
OiB1bmFibGUgdG8gc3BsaXQgdm1hLCBqdXN0IGdldCBhY2NvdW50cyByaWdodCAqLwogCQlpZiAo
dm1fZmxhZ3MgJiBWTV9BQ0NPVU5UICYmICEoZmxhZ3MgJiBNUkVNQVBfRE9OVFVOTUFQKSkKIAkJ
CXZtX2FjY3RfbWVtb3J5KG9sZF9sZW4gPj4gUEFHRV9TSElGVCk7Cg==
--000000000000783fdf06057ef6ee--
