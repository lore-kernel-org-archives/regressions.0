Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33DDC8FC
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 15:54:21 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-965ddb2093bso1932890966b.2
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684166060; x=1686758060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NzJTVdNPJahN4ZaYSD0w8tFsg1kEZiXFWub3q5MNDtA=;
        b=P8nnJt16+mjo39PxYO5U4M45PkUk/fsi27+EpDfDrrEOMN9q+uTLWoB+66tapULTf7
         ueBcqGL5epoo+bRixCvO3RPT3pbSojb3+XFJ5txqVKFOEHMrgECYpLQ+FHk/dFTvCfGg
         HmoNyUrSbV9wNhQaYVEGsAvba9QiPnqsAS0EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166060; x=1686758060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzJTVdNPJahN4ZaYSD0w8tFsg1kEZiXFWub3q5MNDtA=;
        b=V46+2FEGG0+4mokTJ/4TRfnmpnvUXvn3tFjV2tR/cEzdBKSuYYlpDdNtkGo85t+0Jt
         ptL79FA1tZR/6iwaMx5AsLwMW3zDPFwhHRZHPLpebTUMQREQQs/iWoy5HXupRqP36BTv
         gGdnfSjv+xp3/KKFsb4Z3jmg+9Ulziu4WmLtOV2KvCTCd9kVz1sxGVomgZzzgpg/bGTI
         fdEL7UyNARVbSt8nOUioNvSqXjDwhwz26oIXwIBMEIuWN3MoVTiFCuC0Uf86m3KNsAHS
         dgx6AUNGmFc6FqJwtAB0MUWnfXDTt/jylskOh18J01jR2JKp3GMMKPWXfM7NiYhWY+vw
         TMHw==
X-Gm-Message-State: AC+VfDztaMJ9XNVc9wiza6ZpK9pzwj/2ImKdy2dLst5uS1vz9V6KeOM1
	RfESTg/4tXs71NcsLTLuItlkJkVm4Adsjp+7bHN/cQ==
X-Google-Smtp-Source: ACHHUZ5ikUFg6ltAQR2CE3fvgXeLlBVnTwwtWz30qxK9TDndzVrFK3M3Drks0/zbC3QJOvD0xLfhMg==
X-Received: by 2002:a17:907:a49:b0:96a:30b5:cfac with SMTP id be9-20020a1709070a4900b0096a30b5cfacmr16265080ejc.28.1684166059797;
        Mon, 15 May 2023 08:54:19 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id de39-20020a1709069be700b00969e9fef151sm9311240ejc.97.2023.05.15.08.54.18
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:54:18 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so19537081a12.0
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:54:18 -0700 (PDT)
X-Received: by 2002:a17:907:720d:b0:966:a691:55ed with SMTP id
 dr13-20020a170907720d00b00966a69155edmr26683920ejc.70.1684166057908; Mon, 15
 May 2023 08:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202232517.8695-1-michael.christie@oracle.com>
 <20230202232517.8695-9-michael.christie@oracle.com> <aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
 <CAHk-=wgadfsCnKHLON7op=Qs5t3w3PVz5ZDbvbKsfb=yBg=yjQ@mail.gmail.com>
 <78c5e150-26cf-7724-74ee-4a0b16b944b1@oracle.com> <48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
 <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
 <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner> <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
 <33b84605-1d0c-1b0e-7927-7ffa96b3c308@kernel.dk>
In-Reply-To: <33b84605-1d0c-1b0e-7927-7ffa96b3c308@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 May 2023 08:54:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiDqe+H7UnhD0qLbL8K8hnWUEdsRqcM4QnY=gZ3GytBRQ@mail.gmail.com>
Message-ID: <CAHk-=wiDqe+H7UnhD0qLbL8K8hnWUEdsRqcM4QnY=gZ3GytBRQ@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Mike Christie <michael.christie@oracle.com>, nicolas.dichtel@6wind.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, hch@infradead.org, stefanha@redhat.com, 
	jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com, 
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a0257505fbbd77bc"

--000000000000a0257505fbbd77bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 8:52=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 5/15/23 9:44?AM, Linus Torvalds wrote:
> >
> > So I think the patch should just look something like the attached.
> > Mike, can you test this on whatever vhost test-suite?
>
> Seems like that didn't get attached...

Blush. I decided to built-test it, and then forgot to attach it. Here.

                  Linus

--000000000000a0257505fbbd77bc
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lhp0yu7e0>
X-Attachment-Id: f_lhp0yu7e0

IGtlcm5lbC9mb3JrLmMgICAgICAgfCAxMiArKystLS0tLS0tLS0KIGtlcm5lbC92aG9zdF90YXNr
LmMgfCAgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9rZXJuZWwvZm9yay5jIGIva2VybmVsL2ZvcmsuYwppbmRleCBl
ZDRlMDFkYWNjYWEuLmNkMDZiMTM3NDE4ZiAxMDA2NDQKLS0tIGEva2VybmVsL2ZvcmsuYworKysg
Yi9rZXJuZWwvZm9yay5jCkBAIC0yMzM4LDE0ICsyMzM4LDEwIEBAIF9fbGF0ZW50X2VudHJvcHkg
c3RydWN0IHRhc2tfc3RydWN0ICpjb3B5X3Byb2Nlc3MoCiAJCXAtPmZsYWdzIHw9IFBGX0tUSFJF
QUQ7CiAJaWYgKGFyZ3MtPnVzZXJfd29ya2VyKQogCQlwLT5mbGFncyB8PSBQRl9VU0VSX1dPUktF
UjsKLQlpZiAoYXJncy0+aW9fdGhyZWFkKSB7Ci0JCS8qCi0JCSAqIE1hcmsgdXMgYW4gSU8gd29y
a2VyLCBhbmQgYmxvY2sgYW55IHNpZ25hbCB0aGF0IGlzbid0Ci0JCSAqIGZhdGFsIG9yIFNUT1AK
LQkJICovCisJaWYgKGFyZ3MtPmlvX3RocmVhZCkKIAkJcC0+ZmxhZ3MgfD0gUEZfSU9fV09SS0VS
OworCWlmIChhcmdzLT5pZ25vcmVfc2lnbmFscykKIAkJc2lnaW5pdHNldGludigmcC0+YmxvY2tl
ZCwgc2lnbWFzayhTSUdLSUxMKXxzaWdtYXNrKFNJR1NUT1ApKTsKLQl9CiAKIAlpZiAoYXJncy0+
bmFtZSkKIAkJc3Ryc2NweV9wYWQocC0+Y29tbSwgYXJncy0+bmFtZSwgc2l6ZW9mKHAtPmNvbW0p
KTsKQEAgLTI1MTcsOSArMjUxMyw2IEBAIF9fbGF0ZW50X2VudHJvcHkgc3RydWN0IHRhc2tfc3Ry
dWN0ICpjb3B5X3Byb2Nlc3MoCiAJaWYgKHJldHZhbCkKIAkJZ290byBiYWRfZm9ya19jbGVhbnVw
X2lvOwogCi0JaWYgKGFyZ3MtPmlnbm9yZV9zaWduYWxzKQotCQlpZ25vcmVfc2lnbmFscyhwKTsK
LQogCXN0YWNrbGVha190YXNrX2luaXQocCk7CiAKIAlpZiAocGlkICE9ICZpbml0X3N0cnVjdF9w
aWQpIHsKQEAgLTI4NjEsNiArMjg1NCw3IEBAIHN0cnVjdCB0YXNrX3N0cnVjdCAqY3JlYXRlX2lv
X3RocmVhZChpbnQgKCpmbikodm9pZCAqKSwgdm9pZCAqYXJnLCBpbnQgbm9kZSkKIAkJLmZuX2Fy
ZwkJPSBhcmcsCiAJCS5pb190aHJlYWQJPSAxLAogCQkudXNlcl93b3JrZXIJPSAxLAorCQkuaWdu
b3JlX3NpZ25hbHMJPSAxLAogCX07CiAKIAlyZXR1cm4gY29weV9wcm9jZXNzKE5VTEwsIDAsIG5v
ZGUsICZhcmdzKTsKZGlmZiAtLWdpdCBhL2tlcm5lbC92aG9zdF90YXNrLmMgYi9rZXJuZWwvdmhv
c3RfdGFzay5jCmluZGV4IGI3Y2JkNjZmODg5ZS4uMmUzMzRiMmQ3Y2M0IDEwMDY0NAotLS0gYS9r
ZXJuZWwvdmhvc3RfdGFzay5jCisrKyBiL2tlcm5lbC92aG9zdF90YXNrLmMKQEAgLTc1LDcgKzc1
LDggQEAgc3RydWN0IHZob3N0X3Rhc2sgKnZob3N0X3Rhc2tfY3JlYXRlKGludCAoKmZuKSh2b2lk
ICopLCB2b2lkICphcmcsCiAJCQkJICAgICBjb25zdCBjaGFyICpuYW1lKQogewogCXN0cnVjdCBr
ZXJuZWxfY2xvbmVfYXJncyBhcmdzID0gewotCQkuZmxhZ3MJCT0gQ0xPTkVfRlMgfCBDTE9ORV9V
TlRSQUNFRCB8IENMT05FX1ZNLAorCQkuZmxhZ3MJCT0gQ0xPTkVfRlMgfCBDTE9ORV9VTlRSQUNF
RCB8IENMT05FX1ZNIHwKKwkJCQkgIENMT05FX1RIUkVBRCB8IENMT05FX1NJR0hBTkQsCiAJCS5l
eGl0X3NpZ25hbAk9IDAsCiAJCS5mbgkJPSB2aG9zdF90YXNrX2ZuLAogCQkubmFtZQkJPSBuYW1l
LAo=
--000000000000a0257505fbbd77bc--
