Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728801C293
	for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 21:17:29 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so417045866b.3
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694899047; x=1695503847; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nsQTPm1Pcces4jObIPICpUNhN/fBbrd7/cdATB/UoXo=;
        b=fsCn/t9+R+RohC2HQbiwe5urgbfe4oVIx4jK0Y1kTa8tG4aVCj9R0WTrWC8bVtEFG0
         7uH6fUBVBRlAUMHlt9ewBq7jz36TxzWg4Ts7fd5g2VfANtsi7yKDHqHerpIUngANzasM
         18B6fwN62frxK4G6FpjUtzDf4xMeeVjWEvuHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694899047; x=1695503847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsQTPm1Pcces4jObIPICpUNhN/fBbrd7/cdATB/UoXo=;
        b=WdT0JtEk4iHvGaMx3r3WZqzhA600Ipkfw9RChgAAJQiGAL3tg45E0ehucAshvv7ICM
         GEPDzVtuWVOLkuHjAWOVfu5Khb5VhBF7EOhdjvLnaJmry0KJCK02NPPxn4/td4COfjDn
         UleNanUdPpP4RMWRZ/uqZ0/kuvjDjBEnyClg//lGoWbXr7bO4dBi2pgC23Z+7AfYPsoq
         GOkb67u+//KkHwoB51RcQ8MPfSjJ5VIvGccz9+gwfoeQAu8quueoK+UmXDYvaVhwKN3t
         uqxhhnCkDXi5xO4F/LKV2bHiiORNraFkwaVbOassCqJZbc8+R9DA/Gt5rETZLqHHJxjf
         yalg==
X-Gm-Message-State: AOJu0YxPFQrSe1l9VjhStLyJavFYRhwhje95/KfgTN+HBc0VAvqKW1Ee
	8GOvUmkvulzoBZIX4z2Lo43UAnzm9HuMJ8rvz0RZXswP
X-Google-Smtp-Source: AGHT+IHzDuaB0NIfD38jLnMRdx0C/rjV73s/+zjgslakH8tioHo16SFbweY71ZxcWS+5oUqPDSvr9g==
X-Received: by 2002:a17:907:7892:b0:9a6:1eab:9c84 with SMTP id ku18-20020a170907789200b009a61eab9c84mr4663877ejc.9.1694899047467;
        Sat, 16 Sep 2023 14:17:27 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id fi26-20020a170906da1a00b0099bc8db97bcsm4134004ejb.131.2023.09.16.14.17.26
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 14:17:26 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52a39a1c4d5so3953641a12.3
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 14:17:26 -0700 (PDT)
X-Received: by 2002:aa7:cad3:0:b0:52c:e607:3866 with SMTP id
 l19-20020aa7cad3000000b0052ce6073866mr4342397edt.32.1694899046430; Sat, 16
 Sep 2023 14:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1694366957@msgid.manchmal.in-ulm.de> <ZQWUzwiKWLk79qbp@debian.me> <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
In-Reply-To: <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 16 Sep 2023 14:17:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
Message-ID: <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
To: Bagas Sanjaya <bagasdotme@gmail.com>, Michael Labiuk <michael.labiuk@virtuozzo.com>, 
	Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Cc: Linux PARISC <linux-parisc@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: multipart/mixed; boundary="0000000000009839770605806f0b"

--0000000000009839770605806f0b
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Sept 2023 at 12:31, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Does the attached patch fix the problem?

So while I didn't confirm the fix myself, I'm pretty sure that was it.
Getting the return value wrong would cause an incorrect extra
vm_acct_memory() call in the non-error case when VM_ACCOUNT is set
(and mean the loss of one in the error case, but the error case never
happens in practice).

Which then causes 'vm_committed_as' to grow when it shouldn't, and
causes exactly that "Committed_AS" in /proc/meminfo to be off.

So here's the same patch, but now with a proper commit message etc.

I haven't pushed it out (because it would be lovely to get a
"Tested-by" for it, and that will make the commit ID change), but I'll
probably do so later today, with or without confirmation, because it
does seem to be the problem.

              Linus

--0000000000009839770605806f0b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-vm-fix-move_vma-memory-accounting-being-off.patch"
Content-Disposition: attachment; 
	filename="0001-vm-fix-move_vma-memory-accounting-being-off.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lmmj2etv0>
X-Attachment-Id: f_lmmj2etv0

RnJvbSA2NWEwZTEwMGM4YTZmODc2M2E5YzNiZjJjMGIzNjFjOGY0MzZlNDJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IFNhdCwgMTYgU2VwIDIwMjMgMTI6MzE6NDIgLTA3MDAKU3ViamVjdDog
W1BBVENIXSB2bTogZml4IG1vdmVfdm1hKCkgbWVtb3J5IGFjY291bnRpbmcgYmVpbmcgb2ZmCgpD
b21taXQgNDA4NTc5Y2Q2MjdhICgibW06IFVwZGF0ZSBkb192bWlfYWxpZ25fbXVubWFwKCkgcmV0
dXJuCnNlbWFudGljcyIpIHNlZW1zIHRvIGhhdmUgdXBkYXRlZCBvbmUgb2YgdGhlIGNhbGxlcnMg
b2YgZG9fdm1pX211bm1hcCgpCmluY29ycmVjdGx5OiBpdCB1c2VkIHRvIGNoZWNrIGZvciB0aGUg
ZXJyb3IgY2FzZSAod2hpY2ggZGlkbid0CmNoYW5nZTogbmVnYXRpdmUgbWVhbnMgZXJyb3IpLgoK
VGhhdCBjb21taXQgY2hhbmdlZCB0aGUgY2hlY2sgdG8gdGhlIHN1Y2Nlc3MgY2FzZSAod2hpY2gg
ZGlkIGNoYW5nZToKYmVmb3JlIHRoYXQgY29tbWl0LCAwIHdhcyBzdWNjZXNzLCBhbmQgMSB3YXMg
InN1Y2Nlc3MgYW5kIGxvY2sKZG93bmdyYWRlZCIuICBBZnRlciB0aGUgY2hhbmdlLCBpdCdzIGFs
d2F5cyAwIGZvciBzdWNjZXNzLCBhbmQgdGhlIGxvY2sKd2lsbCBoYXZlIGJlZW4gcmVsZWFzZWQg
aWYgcmVxdWVzdGVkKS4KClRoaXMgZGlkbid0IGNoYW5nZSBhbnkgYWN0dWFsIFZNIGJlaGF2aW9y
IF9leGNlcHRfIGZvciBtZW1vcnkgYWNjb3VudGluZwp3aGVuICdWTV9BQ0NPVU5UJyB3YXMgc2V0
IG9uIHRoZSB2bWEuICBXaGljaCBtYWRlIHRoZSB3cm9uZyByZXR1cm4gdmFsdWUKdGVzdCBmYWly
bHkgc3VidGxlLCBzaW5jZSBldmVyeXRoaW5nIGNvbnRpbnVlcyB0byB3b3JrLgoKT3IgcmF0aGVy
IC0gaXQgY29udGludWVzIHRvIHdvcmsgYnV0IHRoZSAiQ29tbWl0dGVkIG1lbW9yeSIgYWNjb3Vu
dGluZwpnb2VzIGFsbCB3b25reSAoQ29tbWl0dGVkX0FTIHZhbHVlIGluIC9wcm9jL21lbWluZm8p
LCBhbmQgZGVwZW5kaW5nIG9uCnNldHRpbmdzIHRoYXQgdGhlbiBjYXVzZXMgcHJvYmxlbXMgbXVj
aCBtdWNoIGxhdGVyIGFzIHRoZSBWTSByZWxpZXMgb24KYm9ndXMgc3RhdGlzdGljcyBmb3IgaXRz
IGhldXJpc3RpY3MuCgpSZXZlcnQgdGhhdCBvbmUgbGluZSBvZiB0aGUgY2hhbmdlIGJhY2sgdG8g
dGhlIG9yaWdpbmFsIGxvZ2ljLgoKRml4ZXM6IDQwODU3OWNkNjI3YSAoIm1tOiBVcGRhdGUgZG9f
dm1pX2FsaWduX211bm1hcCgpIHJldHVybiBzZW1hbnRpY3MiKQpSZXBvcnRlZC1ieTogQ2hyaXN0
b3BoIEJpZWRsIDxsaW51eC1rZXJuZWwuYmZyekBtYW5jaG1hbC5pbi11bG0uZGU+ClJlcG9ydGVk
LWFuZC1iaXNlY3RlZC1ieTogTWljaGFlbCBMYWJpdWsgPG1pY2hhZWwubGFiaXVrQHZpcnR1b3p6
by5jb20+CkNjOiBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4KQ2M6IExpYW0g
Ui4gSG93bGV0dCA8TGlhbS5Ib3dsZXR0QG9yYWNsZS5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8xNjk0MzY2OTU3QG1zZ2lkLm1hbmNobWFsLmluLXVsbS5kZS8KU2lnbmVk
LW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgot
LS0KIG1tL21yZW1hcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbXJlbWFwLmMgYi9tbS9tcmVtYXAuYwppbmRl
eCAwNTY0NzhjMTA2ZWUuLjM4MmU4MWMzM2ZjNCAxMDA2NDQKLS0tIGEvbW0vbXJlbWFwLmMKKysr
IGIvbW0vbXJlbWFwLmMKQEAgLTcxNSw3ICs3MTUsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBt
b3ZlX3ZtYShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAl9CiAKIAl2bWFfaXRlcl9pbml0
KCZ2bWksIG1tLCBvbGRfYWRkcik7Ci0JaWYgKCFkb192bWlfbXVubWFwKCZ2bWksIG1tLCBvbGRf
YWRkciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSkgeworCWlmIChkb192bWlfbXVubWFwKCZ2
bWksIG1tLCBvbGRfYWRkciwgb2xkX2xlbiwgdWZfdW5tYXAsIGZhbHNlKSA8IDApIHsKIAkJLyog
T09NOiB1bmFibGUgdG8gc3BsaXQgdm1hLCBqdXN0IGdldCBhY2NvdW50cyByaWdodCAqLwogCQlp
ZiAodm1fZmxhZ3MgJiBWTV9BQ0NPVU5UICYmICEoZmxhZ3MgJiBNUkVNQVBfRE9OVFVOTUFQKSkK
IAkJCXZtX2FjY3RfbWVtb3J5KG9sZF9sZW4gPj4gUEFHRV9TSElGVCk7Ci0tIAoyLjQyLjAucmMw
LjMwLmdjYTgxYWJhM2IwCgo=
--0000000000009839770605806f0b--
