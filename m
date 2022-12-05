Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24C320E
	for <regressions@lists.linux.dev>; Mon,  5 Dec 2022 16:35:18 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id z4so14169314ljq.6
        for <regressions@lists.linux.dev>; Mon, 05 Dec 2022 08:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj18A3YT1VXcGKwkVQNGdZXvKJxipZMiPmJ3cwUe6+4=;
        b=kmWOVIen900rJlpXjqh31mET1EbW4ScO+St7QQs0w0bfjLpzPzJlJmAvnSvkFECoYT
         13bGcIhR0LW6vmtnryvqm2zqR0A7XuHj7kXMdLwWKtWitxuTRapT1cWX7iCHU1t88b3n
         iOs3vSYGOdzuIo88Y5tl9vEDoviuo9m0GPNYTQ6qU7a7+4uq9DTV2X2zpk1w2IEOkDcW
         SmdJ2HkQkNjaSJFVZ7Z2VR+544SSfvT+SqTKeovxc+BHWQYWr7LE3bClOYHayy/J/Xvf
         fmNxaXF+UcHMgI65Sazzs7DY/SVdqGKjIu6Uv/gi7Nfk4NENisctHdU7TlSkl7zuBi3F
         esVA==
X-Gm-Message-State: ANoB5pnz2nD6GFSSK6xcXiHNUtwMPqcnti8SHrmL0dEGlwSd/G3krl4O
	KJBDlrDM6Vx29XYN0nAtP/05Pn9T2qXSwv8K
X-Google-Smtp-Source: AA0mqf4BCJyHuLxL3+Oi8iuKKgo/6c5ccJR0AM5wAj/fBp0lzMa9BGJOZmaotcByfQCiESCMmtN4Ow==
X-Received: by 2002:a2e:a54a:0:b0:277:7c4:6c49 with SMTP id e10-20020a2ea54a000000b0027707c46c49mr22330626ljn.276.1670258115772;
        Mon, 05 Dec 2022 08:35:15 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id o21-20020a05651205d500b004a62ff61b3dsm2174089lfo.252.2022.12.05.08.35.14
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 08:35:14 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id x28so2121936lfn.6
        for <regressions@lists.linux.dev>; Mon, 05 Dec 2022 08:35:14 -0800 (PST)
X-Received: by 2002:ac2:4f0e:0:b0:4a2:9248:e276 with SMTP id
 k14-20020ac24f0e000000b004a29248e276mr26840275lfr.605.1670258114461; Mon, 05
 Dec 2022 08:35:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info>
 <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
 <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
 <9a03c244-adff-afaf-7385-d8e89cd3f338@leemhuis.info> <02F8DDF1-EC0D-4EBD-88F5-7E000841C337@holtmann.org>
 <CAMfi-DQfuro4c_VUrFHBTv8sPnwuV8XhTV_W7qswGeCC2t-wzg@mail.gmail.com> <457D8649-B855-43BB-B3AD-334E166FED31@holtmann.org>
In-Reply-To: <457D8649-B855-43BB-B3AD-334E166FED31@holtmann.org>
From: Dave Chiluk <chiluk@ubuntu.com>
Date: Mon, 5 Dec 2022 10:35:02 -0600
X-Gmail-Original-Message-ID: <CAMfi-DQXkhG6DSWECpxZ+vH_Qi5boDMx5jNj7v7puLEEXRjUaw@mail.gmail.com>
Message-ID: <CAMfi-DQXkhG6DSWECpxZ+vH_Qi5boDMx5jNj7v7puLEEXRjUaw@mail.gmail.com>
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, "Coelho, Luciano" <luciano.coelho@intel.com>, 
	"Greenman, Gregory" <gregory.greenman@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2022 at 11:46 AM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> Hi Dave,
>
> can you run iwd and set Country=3DDE (or US) in its main.conf. I think
> most distros have a 2.0 package of iwd available. With iwd we have
> implemented all the handling and re-scanning to make sure we actually
> get to use 6Ghz is available.
>
> Btw. you can run iwd from its source tree. No need to install it if
> You don=E2=80=99t want to mess up your system. Just make sure to disable
> wpa_supplicant so it doesn=E2=80=99t interfere.

@Marcel, I was able to build iwd from source, but was unable to get it
to run due to dbus namespace conflicts. I don't know enough about dbus
to debug that further.  Running iwd from the archives (v1.26-3), and
setting COUNTRY=3DUS in main.conf did not enable the 6e bands.

I don't think setting the global region is the issue, as iw reg set US
works fine, and results in the following iw reg get.  Even before
$iw reg set US
phy#0 sets itself to the correct region.  I think the issue is that
the bios, or the firmware blob being loaded by the ax211 that has some
bits improperly set that is causing the 6ghz to be disabled by the
kernel before userspace ever gets involved.

_________________snip_________________
$ sudo iw reg get
global
country US: DFS-FCC
(902 - 904 @ 2), (N/A, 30), (N/A)
(904 - 920 @ 16), (N/A, 30), (N/A)
(920 - 928 @ 8), (N/A, 30), (N/A)
(2400 - 2472 @ 40), (N/A, 30), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
(5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
(5470 - 5730 @ 160), (N/A, 24), (0 ms), DFS
(5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
(5850 - 5895 @ 40), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW, PASSIVE-SCAN
(5925 - 7125 @ 320), (N/A, 12), (N/A), NO-OUTDOOR, PASSIVE-SCAN
(57240 - 71000 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country US: DFS-UNSET
(2402 - 2437 @ 40), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-80MHZ, NO-160=
MHZ
(2422 - 2462 @ 40), (6, 22), (N/A), AUTO-BW, NO-80MHZ, NO-160MHZ
(2447 - 2482 @ 40), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-80MHZ, NO-160M=
HZ
(5170 - 5190 @ 160), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS
(5190 - 5210 @ 160), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS
(5210 - 5230 @ 160), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS
(5230 - 5250 @ 160), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS
(5250 - 5270 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-S=
CAN
(5270 - 5290 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SC=
AN
(5290 - 5310 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-S=
CAN
(5310 - 5330 @ 160), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SC=
AN
(5490 - 5510 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-S=
CAN
(5510 - 5530 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SC=
AN
(5530 - 5550 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-S=
CAN
(5550 - 5570 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SC=
AN
(5570 - 5590 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-S=
CAN
(5590 - 5610 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SC=
AN
(5610 - 5630 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS, PASSIVE-S=
CAN
(5630 - 5650 @ 240), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS, PASSIVE-SC=
AN
(5650 - 5670 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS,
NO-160MHZ, PASSIVE-SCAN
(5670 - 5690 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS,
NO-160MHZ, PASSIVE-SCAN
(5690 - 5710 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40MINUS,
NO-160MHZ, PASSIVE-SCAN
(5710 - 5730 @ 80), (6, 22), (0 ms), DFS, AUTO-BW, NO-HT40PLUS,
NO-160MHZ, PASSIVE-SCAN
(5735 - 5755 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-160MHZ
(5755 - 5775 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-160MHZ
(5775 - 5795 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-160MHZ
(5795 - 5815 @ 80), (6, 22), (N/A), AUTO-BW, NO-HT40PLUS, NO-160MHZ
(5815 - 5835 @ 40), (6, 22), (N/A), AUTO-BW, NO-HT40MINUS, NO-80MHZ, NO-160=
MHZ
_________________snip_________________

I wanted to call out the DFS-UNSET setting on phy#0

Dave.
