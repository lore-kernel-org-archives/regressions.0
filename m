Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260456AA3
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 17:28:38 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso1097581fa.3
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693416517; x=1694021317; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7Q6yLBWpq+0cHDNlXkrewgCyTyJH571bDs7gW4UFiI=;
        b=p9yg1Q94Ft+nOyF5hUN7OQW46RWXNSy5v+wT6t0r0WCX8A1VdYhW7Ty7I+Yr7YsnhC
         1OzgW08Gw6Yg46sPBmrXocmv6ZtP3ydXbGc/6MtM8Rq6j95gj5hxurLefMxLA78WM/rs
         QyKRy8d7pPa200so8D26Zku0ZJd8bBF5Wlgjd3/6JQhJICJucgrjRskfw2QuXnBWy5iv
         r1wGeoQTYDmn7VNSpHUz6u57tcT5xKuO0F91hku7uHtaXmERY7t5g7YuP2dk3ztxuXbM
         mxBMogNMj6enPZ4eD2Oda75q7rWcu6HzVHlA7Z4mDvJqrPefwfBiXe8PgYMw9GhUEu7V
         pqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693416517; x=1694021317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7Q6yLBWpq+0cHDNlXkrewgCyTyJH571bDs7gW4UFiI=;
        b=QGWT29G08WoDhB2pqtn/dvqkh/G3BnB128bSOwx2UR4yexwd2+03uelibqW9B8KfIM
         qdT4WV+86IECA2Pw1d0hUlW++MKxlZqXRg3HEq5W64bCe+fdvPgFaOOL3g+du+4T0LNx
         2OgnhYy+IPvTSr7ec7FIKuf2qG44q/LkzwiwJsmDnezaHLCo4pVatzbStNPTHQPF2ahR
         8CyCOqJt/hN9QTx1leP0Fue+OoSqHA5pSXg/ZNOHMf4bxPLBZ1hBO8Z0mWPg0NDkhZ+e
         Mn8diOZXjNInaRSPyf68QDtblgozoR+ZUTgs06eN40vDUmXC7W2DLsTrRv2uOsHKaRbU
         pO1w==
X-Gm-Message-State: AOJu0YxR/CjojVNyF33y37ZZx7pcq06MwjkG2EYS1AybIbuvDqEJ/H/6
	l3yAB3FKblkpOB8PSzoiLuNrUj4CH+fQ+fLJevQ=
X-Google-Smtp-Source: AGHT+IEHENfxnJ7utzrHwU72Eldx3I/wFmAhJBiTlksgsJYsPSGG/SVz2t9KgZl0m9HD7zSrCTdESjAg2qzDi0FWm4g=
X-Received: by 2002:a2e:8619:0:b0:2b7:31a:9d7c with SMTP id
 a25-20020a2e8619000000b002b7031a9d7cmr2262356lji.33.1693416516483; Wed, 30
 Aug 2023 10:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220727135834.294184-1-brian.gix@intel.com> <20220727135834.294184-3-brian.gix@intel.com>
 <578e6d7afd676129decafba846a933f5@agner.ch> <CABBYNZJGKfwTQM8WAdUGXueTPnFyus1a65UO5mg2g4PXVuCnpA@mail.gmail.com>
 <CABBYNZLgG+zTsk-6ceqzLXXyVRnN6p-m8sFq9Ss7mveD0f9BsQ@mail.gmail.com>
 <CABUQxGxBdAFncJ6YVb7a9gnU-_YZDGFDmpHJTtm5K1tDGEGRDQ@mail.gmail.com>
 <0de3f0d0d5eb6d83cfc8d90cbb2b1ba1@agner.ch> <fcdf856db8fd8e77558b4d82b843c51e@agner.ch>
 <24bf25f7-314f-ca73-59e9-df757732f6a9@leemhuis.info> <ac58995a00cb6ad6bb4ce4c74b006a2f@agner.ch>
 <CABBYNZ+5RMqNVMyYKi+gOVaV+K6k8Z-C37KnfGa=qRUORc3dWg@mail.gmail.com>
In-Reply-To: <CABBYNZ+5RMqNVMyYKi+gOVaV+K6k8Z-C37KnfGa=qRUORc3dWg@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 30 Aug 2023 10:28:23 -0700
Message-ID: <CABBYNZKoXd0+kLdD-FMz3UisrE03fzrt13Zk9-6+tWwuTsKF1g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] Bluetooth: Rework le_scan_restart for hci_sync
To: Stefan Agner <stefan@agner.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Brian Gix <brian.gix@gmail.com>, 
	linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	=?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Tue, Aug 29, 2023 at 1:42=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Stefan, Brian,
>
> On Tue, Aug 29, 2023 at 6:27=E2=80=AFAM Stefan Agner <stefan@agner.ch> wr=
ote:
> >
> > Hi Thorsten,
> >
> > No, this hasn't been addressed so far. I am also not sure how we can
> > help solving that particular issue.
> >
> > Besides this, we have other Bluetooth issues which seem to be Kernel
> > regressions (where downgrading to Linux 5.15 also helps), folks see
> > "hci0: unexpected event for opcode" on Intel but also other systems. We
> > haven't bisected that issue yet. But it seems that the Bluetooth stack
> > is really somewhat unstable in recent releases.
>
>
> I suspect the following change shall make it behave as before, the use
> of hci_cmd_sync_queue is not equivalent to hci_req_sync:
>
> https://gist.github.com/Vudentz/b78f34e3775c8cd2db55b868e5c8ef42
>
> That said, I'm considering removing the whole custom handling for
> HCI_QUIRK_STRICT_DUPLICATE_FILTER and just disable duplicate filtering
> when this flag is set.

Any chance to tests the following changes:

https://patchwork.kernel.org/project/bluetooth/patch/20230829205936.766544-=
1-luiz.dentz@gmail.com/

> > --
> > Stefan
> >
> >
> > On 2023-08-29 13:22, Linux regression tracking (Thorsten Leemhuis)
> > wrote:
> > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > for once, to make this easily accessible to everyone.
> > >
> > > Stefan, was this regression ever addressed? Doesn't look like it from
> > > here, but maybe I'm missing something.
> > >
> > > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' h=
at)
> > > --
> > > Everything you wanna know about Linux kernel regression tracking:
> > > https://linux-regtracking.leemhuis.info/about/#tldr
> > > If I did something stupid, please tell me, as explained on that page.
> > >
> > > #regzbot poke
> > >
> > > On 30.06.23 12:59, Stefan Agner wrote:
> > >> Hi Brian,
> > >>
> > >> Gentle ping on the issue below.
> > >>
> > >> On 2023-06-20 16:41, Stefan Agner wrote:
> > >>> On 2023-06-16 03:22, Brian Gix wrote:
> > >>>
> > >>>> On Thu, Jun 15, 2023 at 11:28=E2=80=AFAM Luiz Augusto von Dentz <l=
uiz.dentz@gmail.com> wrote:
> > >>>>
> > >>>>> +Brian Gix
> > >>>>>
> > >>>>> On Thu, Jun 15, 2023 at 10:27=E2=80=AFAM Luiz Augusto von Dentz
> > >>>>> <luiz.dentz@gmail.com> wrote:
> > >>>>>>
> > >>>>>> Hi Stefan,
> > >>>>>>
> > >>>>>> On Thu, Jun 15, 2023 at 5:06=E2=80=AFAM Stefan Agner <stefan@agn=
er.ch> wrote:
> > >>>>>>>
> > >>>>>>> Hi Brian, hi all,
> > >>>>>>>
> > >>>>>>> We experienced quite some Bluetooth issues after moving from Li=
nux 5.15
> > >>>>>>> to 6.1 on Home Assistant OS, especially on Intel NUC type syste=
ms (which
> > >>>>>>> is a popular choice in our community, so it might just be that)=
. When
> > >>>>>>> continuously scanning/listening for BLE packets, the packet flo=
w
> > >>>>>>> suddenly ends. Depending on which and how many devices (possibl=
y also
> > >>>>>>> other factors) within minutes or hours.
> > >>>>>>>
> > >>>>>>> Jan (in cc) was able to bisect the issue, and was able to pinpo=
int the
> > >>>>>>> problem to this change.
> > >>>>>>>
> > >>>>>>> Meanwhile I was able to confirm, that reverting this single com=
mit on
> > >>>>>>> the latest 6.1.34 seems to resolve the issue.
> > >>>>>>>
> > >>>>>>> I've reviewed the change and surrounding code, and one thing I'=
ve
> > >>>>>>> noticed is that the if statement to set cp.filter_dup in
> > >>>>>>> hci_le_set_ext_scan_enable_sync and hci_le_set_scan_enable_sync=
 are
> > >>>>>>> different. Not sure if that needs to be the way it is, but my o=
utside
> > >>>>>>> gut feeling says hci_le_set_ext_scan_enable_sync should use "if=
 (val &&
> > >>>>>>> hci_dev_test_flag(hdev, HCI_MESH))" as well.
> > >>>>>>>
> > >>>>>>> However, that did not fix the problem (but maybe it is wrong
> > >>>>>>> nonetheless?).
> > >>>>>>>
> > >>>>>>> Anyone has an idea what could be the problem here?
> > >>>>>>
> > >>>>>> Are there any logs of the problem? Does any HCI command fails or
> > >>>>>> anything so that we can track down what could be wrong?
> > >>>
> > >>> No HCI command fails, there is also no issue reported in the kernel=
 log.
> > >>> BlueZ just stops receiving BLE packets, at least from certain devic=
es.
> > >>>
> > >>>>>
> > >>>>> @Brian Gix perhaps you have a better idea what is going wrong her=
e?
> > >>>>
> > >>>> It seems unlikely that this is Mesh related. Mesh does need for fi=
ltering to
> > >>>> be FALSE, and Mesh does not use extended scanning in any case.
> > >>>>
> > >>>> But this was part of the final rewrite to retire the hci_req mecha=
nism in
> > >>>> favor of the hci_sync mechanism. So my best guess off the top of m=
y head is
> > >>>> that there was an unintended race condition that worked better tha=
n the
> > >>>> synchronous single-threading mechanism?  Filtering (or not) should=
 not
> > >>>
> > >>> After review the code I concluded the same. What is a bit surprisin=
g to
> > >>> me is that it is so well reproducible. I guess it is nicer to have =
a
> > >>> reproducible one than a hard to reproduce one :)
> > >>>
> > >>>> prevent advertising packets from permanently wedging.  Does anyone=
 have an
> > >>>> HCI flow log with and without the offending patch?  Ideally they s=
hould be
> > >>>> identical...  If they are not then I obviously did something wrong=
. As this
> > >>>> was not specifically Mesh related, I may have missed some non-mesh=
 corner
> > >>>> cases.
> > >>>
> > >>>
> > >>> I've taken two btmon captures, I created them using:
> > >>> btmon -i hci0 -w /config/hcidump-hci-req-working.log
> > >>>
> > >>> You can find them at:
> > >>> https://os-builds.home-assistant.io/hcidump-hci-req-working.log
> > >>> https://os-builds.home-assistant.io/hcidump-hci-sync-non-working.lo=
g
> > >>
> > >> Could you gain any insights from these logs?
> > >>
> > >> --
> > >> Stefan
> > >>
> > >>
> > >>>
> > >>> This is while running our user space software (Home Assistant with
> > >>> Bluetooth integration). Besides some BLE devices (e.g. Xioami Mi
> > >>> Temperature & Humidity sensor) I have a ESP32 running which sends S=
PAM
> > >>> advertisements every 100ms (this accelerates the issue). In the
> > >>> non-working case you'll see that the system doesn't receive any SPA=
M
> > >>> advertisements after around 27 seconds. The working log shows that =
it
> > >>> continuously receives the same packets (capture 120s).
> > >>>
> > >>> Hope this helps.
> > >>>
> > >>> --
> > >>> Stefan
> > >>>
> > >>>
> > >>
> > >>
>
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz
