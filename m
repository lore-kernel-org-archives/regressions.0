Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AF8480
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 05:36:21 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50098cc8967so8492500e87.1
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 22:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695101780; x=1695706580; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IvSU+3bZOSMZyXebAv4AvhY1QpxDkjAZZYfNw6VtnL8=;
        b=bCZdPGsBT1fyDDJbeC7cuRRxet+Okibpe8ebeQIUVW51EZTtD+3GopyTKjUh6oBJJI
         E1XpKOsRiz3mIDb5ktQwh+dRXWjARaaoCIyTJarR7gv2r9pDqpZp53BzBo7xb4D2sGO8
         QiHSvRlsPZF0UQA8hU6PyR5EtYaLewQPLQUZE+a5VqXilstAid3Sk69woSpTL3aFv5n7
         bA5QDqsiCdXDZ20Rwg6ibyP4Zx6QZGHeJd7xrR+doylRvZraUBam2mSmM2X82t/95Guo
         UtaVj2Vf8Ja08utfN7T2PYX7FDagMDzO1QHOtNH0HHK4gN6qELf9xav6tMrzBR8IClnq
         FDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695101780; x=1695706580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvSU+3bZOSMZyXebAv4AvhY1QpxDkjAZZYfNw6VtnL8=;
        b=O5RTyfDBho07tYBvDuSTQIb2CFSQ8i3yxOUrRBsbycNx5owkJQYmTzDTNkRbm3bhTu
         8niu55OyNcTDhKRs7cFAjLp6gZvffYNBPj29l+Jy3f79jvUYQQh5PC72hQTMqSYPVOkz
         pNmipJHqem/Ay9tvp44we9vTh8EIz4fbbMmylAvztEF3w6xH9T6bkhslitq53Atz7gYg
         auAr8r++Ysvzu3f/o96LOmxZKo9fIwAy2S1Y3hpWeRBoYpgbMPwIdlACcl/E6i/R4gpy
         +febpH44OfMXVYCFCYio8DfjIlZUTG/DU2dwg7g2HQKorNkp/MQAjC+3qoGpe8H8vZru
         DNSw==
X-Gm-Message-State: AOJu0Yx4ARKZJaKGbYKzsbm6JEL+npwWuBaJCBfT4K6yid8s+Ywzug/z
	KI4/9cYjJuPVrr6XLdokiJpFRFD8w8HmdzeBOxGW2npU
X-Google-Smtp-Source: AGHT+IGoKrgDNSJYIWdSnYO8hial2x8HiCxpoe6mPVtLQ1kv4gFSua13dWPpYIKUwrYLqVx4CPbHWGBD7QVZeYSS88E=
X-Received: by 2002:ac2:5467:0:b0:503:56f:c665 with SMTP id
 e7-20020ac25467000000b00503056fc665mr5423683lfn.55.1695101779568; Mon, 18 Sep
 2023 22:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me> <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
 <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com> <CAH2r5mtUedfLSv81Z-Yb3_=AbD_QpT3tVbU1PRzMTituaw7bgA@mail.gmail.com>
In-Reply-To: <CAH2r5mtUedfLSv81Z-Yb3_=AbD_QpT3tVbU1PRzMTituaw7bgA@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Tue, 19 Sep 2023 00:36:07 -0500
Message-ID: <CAH2r5mt6YzapEKDo=hQ64yvBn7=jwMmY1c85NOABKcMPKPp3KA@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Brian Pardy <brian.pardy@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Paulo Alcantara <pc@manguebit.com>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <nspmangalore@gmail.com>, 
	Bharath S M <bharathsm@microsoft.com>
Content-Type: multipart/mixed; boundary="0000000000006e23870605afa38a"

--0000000000006e23870605afa38a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does the attached patch help in your case?  It avoids starting the
laundromat thread for IPC shares (which cuts the number of the threads
in half for many cases) and also avoids starting them if the server
does not support directory leases (e.g. if Samba server instead of
Windows server).


On Mon, Sep 18, 2023 at 10:00=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> Paulo and I were discussing the laundromat thread at the SMB3.1.1 test
> event (at SDC this week) which is now going on - will let you know
> what we find.
>
> One obvious thing is that it probably isn't necessary for cases when
> the server does not support directory leases, but we noticed another
> problem as well.
>
>
> On Mon, Sep 18, 2023 at 9:20=E2=80=AFPM Brian Pardy <brian.pardy@gmail.co=
m> wrote:
> >
> > [RS removed from CC due to bounce message]
> >
> > On Wed, Sep 6, 2023 at 5:03=E2=80=AFPM Brian Pardy <brian.pardy@gmail.c=
om> wrote:
> > > On Tue, Sep 5, 2023 at 9:01=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmai=
l.com> wrote:
> > > > Thanks for the regression report. But if you want to get it fixed,
> > > > you have to do your part: perform bisection. See Documentation/admi=
n-guide/bug-bisect.rst in the kernel sources for how to do that.
> > > >
> > > > Anyway, I'm adding it to regzbot:
> > > >
> > > > #regzbot ^introduced: v6.4..v6.5
> > > > #regzbot title: incorrect CPU utilization report (multiplied) when =
mounting CIFS
> > >
> > > Thank you for directing me to the bug-bisect documentation. Results b=
elow:
> > >
> > > # git bisect bad
> > > d14de8067e3f9653cdef5a094176d00f3260ab20 is the first bad commit
> > > commit d14de8067e3f9653cdef5a094176d00f3260ab20
> > > Author: Ronnie Sahlberg <lsahlber@redhat.com>
> > > Date:   Thu Jul 6 12:32:24 2023 +1000
> > >
> > >     cifs: Add a laundromat thread for cached directories
> > >
> > >     and drop cached directories after 30 seconds
> > >
> > >     Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
> > >     Signed-off-by: Steve French <stfrench@microsoft.com>
> > >
> > >  fs/smb/client/cached_dir.c | 67 ++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  fs/smb/client/cached_dir.h |  1 +
> > >  2 files changed, 68 insertions(+)
> >
> > Is there any further information I can provide to aid in debugging
> > this issue? Should I just expect incorrect load average reporting when
> > a CIFS share is mounted on any kernel >6.5.0?
> >
> > I'm not clear on the value or necessity of this "laundromat thread" -
> > everything worked as expected before it was added - shall I just patch
> > it out of my kernel builds going forward if there is no interest in
> > fixing it? Is a .config option to disable it possible?
>
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--0000000000006e23870605afa38a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-do-not-start-laundromat-thread-when-dir-leases-.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-do-not-start-laundromat-thread-when-dir-leases-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lmpvrl4h0>
X-Attachment-Id: f_lmpvrl4h0

RnJvbSBhNjM1ODZiNGIwYjEyMjY1MDk3ZTg3NGI0MmM3YTJjZGJiZjQxMzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMTkgU2VwIDIwMjMgMDA6Mjg6MDIgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBkbyBub3Qgc3RhcnQgbGF1bmRyb21hdCB0aHJlYWQgd2hlbiBkaXIgbGVhc2VzIGRpc2Fi
bGVkCgpXaGVuIG5vIGRpcmVjdG9yeSBsZWFzZSBzdXBwb3J0LCBvciBmb3IgSVBDIHNoYXJlcyB3
aGVyZSBkaXJlY3RvcmllcwpjYW4gbm90IGJlIG9wZW5lZCwgZG8gbm90IHN0YXJ0IGFuIHVubmVl
ZGVkIGxhdW5kcm9tYXQgdGhyZWFkIGZvcgp0aGF0IG1vdW50IChpdCB3YXN0ZXMgcmVzb3VyY2Vz
KS4KCkZpeGVzOiBkMTRkZTgwNjdlM2YgKCJjaWZzOiBBZGQgYSBsYXVuZHJvbWF0IHRocmVhZCBm
b3IgY2FjaGVkIGRpcmVjdG9yaWVzIikKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZy
ZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYi9jbGllbnQvY2FjaGVkX2Rpci5jIHwgIDYg
KysrKysrCiBmcy9zbWIvY2xpZW50L2NpZnNnbG9iLmggICB8ICAyICstCiBmcy9zbWIvY2xpZW50
L2NpZnNwcm90by5oICB8ICAyICstCiBmcy9zbWIvY2xpZW50L2Nvbm5lY3QuYyAgICB8ICA5ICsr
KysrKystLQogZnMvc21iL2NsaWVudC9taXNjLmMgICAgICAgfCAxNiArKysrKysrKysrLS0tLS0t
CiBmcy9zbWIvY2xpZW50L3NtYjJwZHUuYyAgICB8ICA1ICsrKystCiA2IGZpbGVzIGNoYW5nZWQs
IDI5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9j
bGllbnQvY2FjaGVkX2Rpci5jIGIvZnMvc21iL2NsaWVudC9jYWNoZWRfZGlyLmMKaW5kZXggYjE3
ZjA2N2U0YWRhLi5hN2NiYWEzMjAwNWMgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvY2FjaGVk
X2Rpci5jCisrKyBiL2ZzL3NtYi9jbGllbnQvY2FjaGVkX2Rpci5jCkBAIC00NTAsNiArNDUwLDkg
QEAgdm9pZCBpbnZhbGlkYXRlX2FsbF9jYWNoZWRfZGlycyhzdHJ1Y3QgY2lmc190Y29uICp0Y29u
KQogewogCXN0cnVjdCBjYWNoZWRfZmlkcyAqY2ZpZHMgPSB0Y29uLT5jZmlkczsKIAlzdHJ1Y3Qg
Y2FjaGVkX2ZpZCAqY2ZpZCwgKnE7CisKKwlpZiAoY2ZpZHMgPT0gTlVMTCkKKwkJcmV0dXJuOwog
CUxJU1RfSEVBRChlbnRyeSk7CiAKIAlzcGluX2xvY2soJmNmaWRzLT5jZmlkX2xpc3RfbG9jayk7
CkBAIC02NTEsNiArNjU0LDkgQEAgdm9pZCBmcmVlX2NhY2hlZF9kaXJzKHN0cnVjdCBjYWNoZWRf
ZmlkcyAqY2ZpZHMpCiAJc3RydWN0IGNhY2hlZF9maWQgKmNmaWQsICpxOwogCUxJU1RfSEVBRChl
bnRyeSk7CiAKKwlpZiAoY2ZpZHMgPT0gTlVMTCkKKwkJcmV0dXJuOworCiAJaWYgKGNmaWRzLT5s
YXVuZHJvbWF0KSB7CiAJCWt0aHJlYWRfc3RvcChjZmlkcy0+bGF1bmRyb21hdCk7CiAJCWNmaWRz
LT5sYXVuZHJvbWF0ID0gTlVMTDsKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvY2lmc2dsb2Iu
aCBiL2ZzL3NtYi9jbGllbnQvY2lmc2dsb2IuaAppbmRleCAwMzJkODcxNmY2NzEuLmY1OTRmY2Mw
ZTg4OSAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jaWZzZ2xvYi5oCisrKyBiL2ZzL3NtYi9j
bGllbnQvY2lmc2dsb2IuaApAQCAtMTk0Myw3ICsxOTQzLDcgQEAgcmVxdWlyZSB1c2Ugb2YgdGhl
IHN0cm9uZ2VyIHByb3RvY29sICovCiAgKiBjaWZzSW5vZGVJbmZvLT5sb2NrX3NlbQljaWZzSW5v
ZGVJbmZvLT5sbGlzdAkJY2lmc19pbml0X29uY2UKICAqCQkJCS0+Y2FuX2NhY2hlX2JybGNrcwog
ICogY2lmc0lub2RlSW5mby0+ZGVmZXJyZWRfbG9jawljaWZzSW5vZGVJbmZvLT5kZWZlcnJlZF9j
bG9zZXMJY2lmc0lub2RlSW5mb19hbGxvYwotICogY2FjaGVkX2ZpZC0+ZmlkX211dGV4CQljaWZz
X3Rjb24tPmNyZmlkCQl0Y29uSW5mb0FsbG9jCisgKiBjYWNoZWRfZmlkLT5maWRfbXV0ZXgJCWNp
ZnNfdGNvbi0+Y3JmaWQJCXRjb25faW5mb19hbGxvYwogICogY2lmc0ZpbGVJbmZvLT5maF9tdXRl
eAkJY2lmc0ZpbGVJbmZvCQkJY2lmc19uZXdfZmlsZWluZm8KICAqIGNpZnNGaWxlSW5mby0+Zmls
ZV9pbmZvX2xvY2sJY2lmc0ZpbGVJbmZvLT5jb3VudAkJY2lmc19uZXdfZmlsZWluZm8KICAqCQkJ
CS0+aW52YWxpZEhhbmRsZQkJCWluaXRpYXRlX2NpZnNfc2VhcmNoCmRpZmYgLS1naXQgYS9mcy9z
bWIvY2xpZW50L2NpZnNwcm90by5oIGIvZnMvc21iL2NsaWVudC9jaWZzcHJvdG8uaAppbmRleCA3
ZDgwMzU4NDY2ODAuLjc0YzQyOGQzYzkxNiAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jaWZz
cHJvdG8uaAorKysgYi9mcy9zbWIvY2xpZW50L2NpZnNwcm90by5oCkBAIC01MTIsNyArNTEyLDcg
QEAgZXh0ZXJuIGludCBDSUZTU01CTG9nb2ZmKGNvbnN0IHVuc2lnbmVkIGludCB4aWQsIHN0cnVj
dCBjaWZzX3NlcyAqc2VzKTsKIAogZXh0ZXJuIHN0cnVjdCBjaWZzX3NlcyAqc2VzSW5mb0FsbG9j
KHZvaWQpOwogZXh0ZXJuIHZvaWQgc2VzSW5mb0ZyZWUoc3RydWN0IGNpZnNfc2VzICopOwotZXh0
ZXJuIHN0cnVjdCBjaWZzX3Rjb24gKnRjb25JbmZvQWxsb2Modm9pZCk7CitleHRlcm4gc3RydWN0
IGNpZnNfdGNvbiAqdGNvbl9pbmZvX2FsbG9jKGJvb2wgaW5pdF9jYWNoZWRfZGlycyk7CiBleHRl
cm4gdm9pZCB0Y29uSW5mb0ZyZWUoc3RydWN0IGNpZnNfdGNvbiAqKTsKIAogZXh0ZXJuIGludCBj
aWZzX3NpZ25fcnFzdChzdHJ1Y3Qgc21iX3Jxc3QgKnJxc3QsIHN0cnVjdCBUQ1BfU2VydmVyX0lu
Zm8gKnNlcnZlciwKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvY29ubmVjdC5jIGIvZnMvc21i
L2NsaWVudC9jb25uZWN0LmMKaW5kZXggNjg3NzU0NzkxYmYwLi40NWU2MGMwZDI2MmMgMTAwNjQ0
Ci0tLSBhL2ZzL3NtYi9jbGllbnQvY29ubmVjdC5jCisrKyBiL2ZzL3NtYi9jbGllbnQvY29ubmVj
dC5jCkBAIC0xODgyLDcgKzE4ODIsOSBAQCBjaWZzX3NldHVwX2lwYyhzdHJ1Y3QgY2lmc19zZXMg
KnNlcywgc3RydWN0IHNtYjNfZnNfY29udGV4dCAqY3R4KQogCQl9CiAJfQogCi0JdGNvbiA9IHRj
b25JbmZvQWxsb2MoKTsKKwkvKiBubyBuZWVkIHRvIHNldHVwIGRpcmVjdG9yeSBjYWNoaW5nIG9u
IElQQyBzaGFyZSwgc28gcGFzcyBpbiBmYWxzZSAqLworCXRjb24gPSB0Y29uX2luZm9fYWxsb2Mo
ZmFsc2UpOworCiAJaWYgKHRjb24gPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKQEAgLTI0
OTIsNyArMjQ5NCwxMCBAQCBjaWZzX2dldF90Y29uKHN0cnVjdCBjaWZzX3NlcyAqc2VzLCBzdHJ1
Y3Qgc21iM19mc19jb250ZXh0ICpjdHgpCiAJCWdvdG8gb3V0X2ZhaWw7CiAJfQogCi0JdGNvbiA9
IHRjb25JbmZvQWxsb2MoKTsKKwlpZiAoc2VzLT5zZXJ2ZXItPmNhcGFiaWxpdGllcyAmIFNNQjJf
R0xPQkFMX0NBUF9ESVJFQ1RPUllfTEVBU0lORykKKwkJdGNvbiA9IHRjb25faW5mb19hbGxvYyh0
cnVlKTsKKwllbHNlCisJCXRjb24gPSB0Y29uX2luZm9fYWxsb2MoZmFsc2UpOwogCWlmICh0Y29u
ID09IE5VTEwpIHsKIAkJcmMgPSAtRU5PTUVNOwogCQlnb3RvIG91dF9mYWlsOwpkaWZmIC0tZ2l0
IGEvZnMvc21iL2NsaWVudC9taXNjLmMgYi9mcy9zbWIvY2xpZW50L21pc2MuYwppbmRleCAzNjZi
NzU1Y2E5MTMuLmVjMjNiOTk4OWI2MyAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9taXNjLmMK
KysrIGIvZnMvc21iL2NsaWVudC9taXNjLmMKQEAgLTExMywxOCArMTEzLDIyIEBAIHNlc0luZm9G
cmVlKHN0cnVjdCBjaWZzX3NlcyAqYnVmX3RvX2ZyZWUpCiB9CiAKIHN0cnVjdCBjaWZzX3Rjb24g
KgotdGNvbkluZm9BbGxvYyh2b2lkKQordGNvbl9pbmZvX2FsbG9jKGJvb2wgZGlyX2xlYXNlc19l
bmFibGVkKQogewogCXN0cnVjdCBjaWZzX3Rjb24gKnJldF9idWY7CiAKIAlyZXRfYnVmID0ga3ph
bGxvYyhzaXplb2YoKnJldF9idWYpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXJldF9idWYpCiAJCXJl
dHVybiBOVUxMOwotCXJldF9idWYtPmNmaWRzID0gaW5pdF9jYWNoZWRfZGlycygpOwotCWlmICgh
cmV0X2J1Zi0+Y2ZpZHMpIHsKLQkJa2ZyZWUocmV0X2J1Zik7Ci0JCXJldHVybiBOVUxMOwotCX0K
KworCWlmIChkaXJfbGVhc2VzX2VuYWJsZWQgPT0gdHJ1ZSkgeworCQlyZXRfYnVmLT5jZmlkcyA9
IGluaXRfY2FjaGVkX2RpcnMoKTsKKwkJaWYgKCFyZXRfYnVmLT5jZmlkcykgeworCQkJa2ZyZWUo
cmV0X2J1Zik7CisJCQlyZXR1cm4gTlVMTDsKKwkJfQorCX0gZWxzZQorCQlyZXRfYnVmLT5jZmlk
cyA9IE5VTEw7CiAKIAlhdG9taWNfaW5jKCZ0Y29uSW5mb0FsbG9jQ291bnQpOwogCXJldF9idWYt
PnN0YXR1cyA9IFRJRF9ORVc7CmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L3NtYjJwZHUuYyBi
L2ZzL3NtYi9jbGllbnQvc21iMnBkdS5jCmluZGV4IDQ0ZDQ5NDNlOWM1Ni4uYzYzYjcyZWQ3ZmU5
IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L3NtYjJwZHUuYworKysgYi9mcy9zbWIvY2xpZW50
L3NtYjJwZHUuYwpAQCAtMzg3OCw3ICszODc4LDEwIEBAIHZvaWQgc21iMl9yZWNvbm5lY3Rfc2Vy
dmVyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkJZ290byBkb25lOwogCiAJLyogYWxsb2Nh
dGUgYSBkdW1teSB0Y29uIHN0cnVjdCB1c2VkIGZvciByZWNvbm5lY3QgKi8KLQl0Y29uID0gdGNv
bkluZm9BbGxvYygpOworCWlmIChwc2VydmVyLT5jYXBhYmlsaXRpZXMgJiBTTUIyX0dMT0JBTF9D
QVBfTEVBU0lORykKKwkJdGNvbiA9IHRjb25faW5mb19hbGxvYyh0cnVlKTsKKwllbHNlCisJCXRj
b24gPSB0Y29uX2luZm9fYWxsb2MoZmFsc2UpOwogCWlmICghdGNvbikgewogCQlyZXNjaGVkID0g
dHJ1ZTsKIAkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHNlcywgc2VzMiwgJnRtcF9zZXNfbGlz
dCwgcmxpc3QpIHsKLS0gCjIuMzkuMgoK
--0000000000006e23870605afa38a--
