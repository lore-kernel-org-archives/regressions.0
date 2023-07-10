Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210810783
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 11:02:04 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b6ff1ada5dso67353071fa.2
        for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squaremind-io.20221208.gappssmtp.com; s=20221208; t=1688986922; x=1691578922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuI1AtaDdhWF7NCc6Hc97WOaLYYe+3jyQNThbf6myps=;
        b=XFWSrVeCBiWVwBNI5dR+9AGUmb6gOUw+Iq6FwFBTMSZt6xajvu4zfvDpelNZ2l7Sg6
         J1KeVnOCNe/umDV783lLSf2CUcdq6dwxmGJaYudstQ85yd3f2ntVsWlNlZvBbLbGGjm2
         Y/TnJCsytMwYH8PWHxjt4Q0HxUCSjeOC13ghjIvK8hQd9bkkH79PYign3oBStNMpZjqx
         rDq+CL58l8og5PPwAqsRYhHu5lMJf1mpo85mCD54LZEwZpZuAixY91ZewCjPv7VjyaMb
         tZj0zzckDPfDySpqn+O+z8uVKSffbxgYHvaHGbfCALPn8O+JhcaTCmglCJJRttk6V/DX
         Spyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688986922; x=1691578922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuI1AtaDdhWF7NCc6Hc97WOaLYYe+3jyQNThbf6myps=;
        b=XjYtfi0SO6cxZhD2KCam2OylASP2d2YAtcKtaLx0NblvrKuooE3XVF2cEVngAMQDQA
         nfN6EGnY/ZD27ggUixujcu2K8qYfkZDN1YTY3TfdXEcHAzQYWwGNl3LkQHGiWNCjKD7u
         kPppmL62NidgsrbZmdU7qofU/gKWyGNhZpcHj3vdvvuaZZkhIwqarJinZqqBB+k3vXHl
         pucIji0szxWMWgdNv972MFc/WKC2HaRWhyVEroGDs2C+elWeuc1EnmKPhmN1TkWcRcMU
         ZDASA+/4m1xrI7bD1kkXsVVXqgZ0OLr1ii+085ru+uyTyigoKhcoZnpxaqabguZzTw7A
         t6OA==
X-Gm-Message-State: ABy/qLZKInVvsPzi4YF3D05LHJTqeubbSwZjItcvEpNvIWXP0hqkxMdS
	gRAhggBD0grj0pO/cfPOcScrrgYwAt12V7e3SpAYjXz7smXO80FcHihxWQ==
X-Google-Smtp-Source: APBJJlGqqZ+G3L2lcxHSxhI6ACzPEny20kNrhohmp+A+bDoyQ7dG1Wc1GgV5a0v/h4WHgOsN5BgO6tf3jNfNX767hDs=
X-Received: by 2002:a2e:854c:0:b0:2b5:974f:385 with SMTP id
 u12-20020a2e854c000000b002b5974f0385mr10315455ljj.9.1688986922312; Mon, 10
 Jul 2023 04:02:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
 <fba6f326-679b-d160-5ab6-3f885bacb5a2@leemhuis.info>
In-Reply-To: <fba6f326-679b-d160-5ab6-3f885bacb5a2@leemhuis.info>
From: Tanguy Serrat <tanguy@squaremind.io>
Date: Mon, 10 Jul 2023 13:01:51 +0200
Message-ID: <CAPr+0HY2iyPiZwABc6+5dBc+MA6CYd6v1hT-QyzApokogFTVvw@mail.gmail.com>
Subject: Re: ath11k: QCN9074: low HE-MCS index
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> FWIW for anyone seeing this that might wonder: yes, this is the same
> issue that is already brought up on the lists here:

> https://lore.kernel.org/all/1326a6e4-758d-3344-d90c-8a126748b034@gmail.co=
m/

Thank you Thorsten. This is a separate new issue. I have opened a new
ticket here with my latest findings:
https://bugzilla.kernel.org/show_bug.cgi?id=3D217652

Any help would be greatly appreciated, this is quite blocking in our
product development.


Le lun. 26 juin 2023 =C3=A0 15:50, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> a =C3=A9crit :
>
> On 26.06.23 14:27, Tanguy Serrat wrote:
> >
> > In my quest to get 2x QCN9074 paired and achieving high throughput
> > data transfers, I am now facing issues with the AP configuration.
> >
> > Specifically, I cannot get more than HE-MCS 5 (AP and client 50cm
> > apart) although SNR and RSSI are always very strong and supposedly in
> > specs (SNR > 40db or RSSI < -48db).
>
> FWIW for anyone seeing this that might wonder: yes, this is the same
> issue that is already brought up on the lists here:
>
> https://lore.kernel.org/all/1326a6e4-758d-3344-d90c-8a126748b034@gmail.co=
m/
>
> Sadly nothing much came from it (and coincidentally I tried to revive
> that thread a few minutes after Tanguy Serrat sent the quoted mail,
> which was an hour before I saw it -- aka: race condition). Well, maybe
> one of these mails hopefully will help.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot ^backmonitor: d90c-8a126748b034@gmail.com/
>
> > iw wlp6s0 link
> > Connected to 00:15:61:27:cd:dc (on wlp6s0)
> > SSID: Space
> > freq: 5745
> > RX: 1073584482 bytes (708567 packets)
> > TX: 355824214 bytes (256143 packets)
> > signal: -40 dBm
> > rx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0
> > tx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0
> >
> > In this case iperf3 shows ~950Mbits/s transfer speed. I am hoping to
> > get at least twice as much.
> >
> > It seems to me that either mac80211, ath11k or hostapd are not
> > advertising the available capabilities correctly. I have tried setting
> > hostapd he_basic_mcs_set=3D65530 or others but did not help.
> >
> > I have added ieee80211_regdom=3DFR option to cfg80211 module on the AP
> > side. Channel selection is done with ACS survey. I also tried other
> > channels/frequencies without success eg. 5500Mhz.
> >
> > iw reg get
> > global
> > country FR: DFS-ETSI
> > (2400 - 2483 @ 40), (N/A, 20), (N/A)
> > (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> > (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> > (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
> > (5725 - 5875 @ 80), (N/A, 13), (N/A)
> > (5945 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
> > (57000 - 71000 @ 2160), (N/A, 40), (N/A)
> >
> > phy#0 (self-managed)
> > country US: DFS-FCC
> > (2402 - 2472 @ 40), (6, 30), (N/A)
> > (5170 - 5250 @ 80), (N/A, 30), (N/A), AUTO-BW
> > (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
> > (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
> > (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
> > (5945 - 7125 @ 160), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW
> >
> > Current setup is:
> > - Intel x86
> > - Ubuntu 22.04
> > - Kernel built from ath 6.4.0-rc6-wt-ath+ (commit:
> > c60d15f389ef9832a8da410e438d81b10327751f)
> > with commit reverted from the bug ticket I opened
> > (https://bugzilla.kernel.org/show_bug.cgi?id=3D217536).
> > - 1x QCN9074 as AP, 1x as managed client 50cm apart
> > - Both AP and Client are running with the latest 2.7.0 FW.
> >
> > I have started from this ticket
> > (https://bugzilla.kernel.org/show_bug.cgi?id=3D217286) hostapd config
> > file, and adapted, please find attached.
> >
> > Anyone seeing what could be my issue / how I could debug further ?
> >
> > Thank you !
> > Tanguy
> >
> >
