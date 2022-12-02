Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B234C89
	for <regressions@lists.linux.dev>; Fri,  2 Dec 2022 16:55:34 +0000 (UTC)
Received: from smtpclient.apple (p4fefca0f.dip0.t-ipconnect.de [79.239.202.15])
	by mail.holtmann.org (Postfix) with ESMTPSA id 4E9A4CECFF;
	Fri,  2 Dec 2022 17:46:19 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <9a03c244-adff-afaf-7385-d8e89cd3f338@leemhuis.info>
Date: Fri, 2 Dec 2022 17:46:18 +0100
Cc: Dave Chiluk <chiluk@ubuntu.com>,
 "Coelho, Luciano" <luciano.coelho@intel.com>,
 "Greenman, Gregory" <gregory.greenman@intel.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <02F8DDF1-EC0D-4EBD-88F5-7E000841C337@holtmann.org>
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info>
 <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
 <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
 <9a03c244-adff-afaf-7385-d8e89cd3f338@leemhuis.info>
To: Thorsten Leemhuis <regressions@leemhuis.info>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

Hi Thorsten,

>> The other possibility is that this is actually a bios bug, as the DSM
>> is being read out of ACPI.  In which case that would be Dell's fault.
>=20
> Yes and no, but no:
>=20
> A kernel change exposed this problem, hence it doesn't matter if the
> BIOS is faulty: it's makes it a kernel regression and those are not
> allowed. For more on this see
> https://docs.kernel.org/admin-guide/reporting-issues.html
>=20
> That at least would be the normal approach. But the thing is: the =
legal
> implications when it comes to things like wifi make this somewhat
> trickier. :-/

so you need to set your country code first before any of the regulatory
enabled channels on 6Ghz get used. Otherwise you are stuck in the world
domain that doesn=E2=80=99t allow 6Ghz at all.

Two choices, either you run iwd and just set Country=3DDE where this =
than
would be persistent; see iwd.config(5). Or you do this via iw reg set DE
manually. wpa_supplicant has a set_country wrapper, but I don=E2=80=99t =
see it
being used anywhere, so I assume you have to do this manually when using
wpa_supplicant.

And of course tools like crda etc. need to be fully functional to load
the appropriate regulatory information. Since any 6Ghz operation is
blocked by default.

Regards

Marcel

