Received: from msk-hq-mr3.amt.ru (msk-hq-mr3.amt.ru [212.233.68.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A60382395
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.233.68.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667754; cv=none; b=HDghoOilcc5hJJ6ilfqX0aLPPjLeqCDXfP4uAuWcqZQXZctZ1cqzag3z1TrSA0hoGycKVKBkXSBZXt1BQxVV+uDdoEVnh6KOM8fVVTS5AkRCvtst+6u9WC/M8XgMckm6XVnjQTioOmgUV3bEjFltmMT3J4vt9QmSnk3MKp+lyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667754; c=relaxed/simple;
	bh=NY//a0emxdAkVp85bdfjdqGX6m8Mi7eA/32/M8YTDS0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tOUxBN3MGhXBOTu5T9FyzOp472yMsoz1QvlM9PmHPjgO25Dt1jFANIozYPFxXUAHjmFDB1cV63XVVXv4BvPVUPUi12M5PhKdMFHA0DfF1wsnxI6QgJVD2fJrEUfVIdeCGbFqLDP+CYGIO+TRA1y9KDa3o4MTZ7qCzF2yFF1X/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=amt.ru; spf=pass smtp.mailfrom=amt.ru; arc=none smtp.client-ip=212.233.68.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=amt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amt.ru
Received: by msk-hq-mr3.amt.ru (Mailsecure, from userid 998)
	id B72CCA616EB; Mon, 20 Apr 2026 06:41:28 +0000 (UTC)
Received: from msk-hq-es1.amt.ru (10.0.7.34) by msk-hq-es2.amt.ru (10.0.7.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 20 Apr
 2026 09:41:25 +0300
Received: from msk-hq-es1.amt.ru ([10.0.7.34]) by msk-hq-es1.amt.ru
 ([10.0.7.34]) with mapi id 15.02.0986.022; Mon, 20 Apr 2026 09:41:25 +0300
From: "Sagatov, Evgeniy" <esagatov@amt.ru>
To: Thorsten Leemhuis <regressions@leemhuis.info>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>, Michal Wilczynski
	<michal.wilczynski@intel.com>
Subject: RE: Pressing the power button causes the device to freeze completely
Thread-Topic: Pressing the power button causes the device to freeze completely
Thread-Index: AQHc0I5dWWz85Qs22EiEOZsB00kgHbXne/2A
Date: Mon, 20 Apr 2026 06:41:25 +0000
Message-ID: <d161effaca5a456dabcfbb7dbbf105d8@amt.ru>
References: <c64d69bb-9df9-46b7-a1ad-aada30310d36@leemhuis.info>
 <26521776666243@mail.yandex.ru>
In-Reply-To: <26521776666243@mail.yandex.ru>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailsecure-Released: 1

Hello Thorsten,

Thanks for the detailed manual!

I determined that the problem started between versions 6.7.12 and 6.8-rc1. =
Then I ran a 'git bisect' according to the manual.

Result:
b0d326da462e20285236e11e4cbc32085de9f363 is the first bad commit
commit b0d326da462e20285236e11e4cbc32085de9f363
Merge: 8c94ccc7cd69 e37617c8e53a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jan 18 11:57:33 2024 -0800

    Merge tag 'sched-urgent-2024-01-18' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/tip/tip

    Pull scheduler fix from Ingo Molnar:
     "Fix a cpufreq related performance regression on certain systems, wher=
e
      the CPU would remain at the lowest frequency, degrading performance
      substantially"

    * tag 'sched-urgent-2024-01-18' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/tip/tip:
      sched/fair: Fix frequency selection for non-invariant case

 kernel/sched/cpufreq_schedutil.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

----
Sincerely, Evgeny Sagatov

=9A----------------
16.04.2026, 20:35, Thorsten Leemhuis (mailto:regressions@leemhuis.info):
To: Evgeny Sagatov (mailto:sagatov@ya.ru), Rafael J. Wysocki (mailto:rafael=
.j.wysocki@intel.com);
Copy: mailto:regressions@lists.linux.dev, LKML (mailto:linux-kernel@vger.ke=
rnel.org), Michal Wilczynski (mailto:michal.wilczynski@intel.com);
Topic: Pressing the power button causes the device to freeze completely;
=9A
On 4/16/26 19:22, Evgeny Sagatov wrote:
=9ACould you please try 7.0 as well?
=9AI compiled 7.0.0 kernel from sources.
=9AUnfortunately, this kernel also freezes when the power button is pressed=
.

Thx for testing.
=9A=9A
=9AHow did you find that this causes the problem? Did you do a proper
=9Abisection and thus checked if the parent of that commit really works?
=9A=9A
=9AI don't think I did it correctly.
=9ABecause the previous commits didn't shut down the PC or cause it to
=9Afreeze. I think they just weren't working.
=9A=9A
=9AI also tried a very simple module tity-power-button. Pressing the power
=9Abutton when using this module also causes a full freeze.
=9AI think the problem lies with the ACPI functionality, but none of kernel
=9Aoptions helped fix it.
=9A=9A
=9AI'm confused.

Then you likely want to properly bisect the bug. Might be best to do
that on a Debian 12 install (where everything used to be working) by
following this guide:

https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

But be warned: the regression is old. Even if the culprit is identified
the usual rules wrt to "no regression" might not apply, as fixing the
regression could cause regressions for other users.

Ciao, Thorsten
=9A
=9A----------------
=9ATo: Evgeny Sagatov (mailto:sagatov@ya.ru), Rafael J. Wysocki
=9A(mailto:rafael.j.wysocki@intel.com);
=9ACopy: mailto:regressions@lists.linux.dev, LKML (mailto:linux-kernel@vger=
.kernel.org),
=9AMichal Wilczynski (mailto:michal.wilczynski@intel.com);
=9ATopic: Pressing the power button causes the device to freeze completely;
=9A16.04.2026, 11:23, "Thorsten Leemhuis" <mailto:regressions@leemhuis.info=
>:
=9A
=9A=9A=9A=9A=9A[removing the stable list, this is not something for them]
=9A
=9A=9A=9A=9A=9AOn 4/13/26 18:46, Evgeny Sagatov wrote:
=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI have a PC with a motherboard GA-EP45T-UD3LR=
 (Rev. 1.0) <https://
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Ahttps://www.gigabyte.com/Motherboard/GA-EP45T=
-UD3LR-rev-10 <https://
=9A=9A=9A=9A=9A=9A=9A=9A=9Ahttps://www.gigabyte.com/Motherboard/GA-EP45T-UD=
3LR-rev-10>> and
=9A=9A=9A=9A=9A=9A=9A=9A=9Aprocessor Intel
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9ACore 2 Quad Q9550.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9APreviously, I had Debian 12 with kernel 6.1 i=
nstalled, and
=9A=9A=9A=9A=9A=9A=9A=9A=9Apressing the
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Apower button would shut down the PC as usual.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI updated to Debian 13 with kernel 6.12.74, a=
nd now pressing
=9A=9A=9A=9A=9A=9A=9A=9A=9Athe power
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Abutton causes the PC to freeze completely.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI see that systemd doesn't even begin to shut=
 down. It freezes
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Aimmediately after pressing the button. There'=
s no error message in
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Aconsole. There's no error message in the logs=
 either.
=9A=9A=9A=9A=9A=9A=9A=9A=9ANetconsole doesn't
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Areport any errors, and the kernel doesn't pan=
ic. It just
=9A=9A=9A=9A=9A=9A=9A=9A=9Afreezes completely.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI checked that Live CD with Debian 12 continu=
e to shut down
=9A=9A=9A=9A=9A=9A=9A=9A=9Anormally,
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Abut Live CD with Debian 13 freeze.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI tried updating and resetting the BIOS. I tr=
ied various kernel
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Aparameters related to ACPI settings. I also t=
ried kernels 6.18
=9A=9A=9A=9A=9A=9A=9A=9A=9Aand 6.19.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9ANothing fixed the problem.
=9A
=9A
=9A=9A=9A=9A=9ACould you please try 7.0 as well? It contains a fix for the =
commit you
=9A=9A=9A=9A=9Amentioned below.
=9A=9A=9A=9A=9A=9A
=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AIf I unload the "button" module, the system d=
oesn't freeze, but
=9A=9A=9A=9A=9A=9A=9A=9A=9Ait also
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Adoesn't shut down.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI built "button" module by rolling back its v=
ersion to commit
=9A=9A=9A=9A=9A=9A=9A=9A=9A1a20d40
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A<https://github.com/torvalds/linux/ <https://=
github.com/
=9A=9A=9A=9A=9A=9A=9A=9A=9Atorvalds/linux/>
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Acommit/1a20d409c874255086e2f42a729826d490294c=
91>, which
=9A=9A=9A=9A=9A=9A=9A=9A=9Acorresponds to
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Akernel version 6.1. This module does not free=
ze, but does not
=9A=9A=9A=9A=9A=9A=9A=9A=9Aturn off
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Athe PC either.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI've found that the freezes have been occurri=
ng since commit
=9A=9A=9A=9A=9A=9A=9A=9A=9A0d51157
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A<https://github.com/torvalds/linux/ <https://=
github.com/
=9A=9A=9A=9A=9A=9A=9A=9A=9Atorvalds/linux/>
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Acommit/0d51157dfaac05ea66616d8a250dce04bef49a=
4f>.
=9A
=9A
=9A=9A=9A=9A=9AThat is 0d51157dfaac05 ("ACPI: button: Eliminate the driver =
notify
=9A=9A=9A=9A=9Acallback") [v6.5-rc1] from Rafael. But that is a very old co=
mmit; and
=9A=9A=9A=9A=9Ayou seem to be switching distro versions and kernel at the s=
ame time,
=9A=9A=9A=9A=9Awhich could interfere.
=9A
=9A=9A=9A=9A=9AHow did you find that this causes the problem? Did you do a =
proper
=9A=9A=9A=9A=9Abisection and thus checked if the parent of that commit real=
ly works?
=9A=9A=9A=9A=9A=9A
=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AUnfortunately, my skills are not enough to un=
derstand the
=9A=9A=9A=9A=9A=9A=9A=9A=9Areason for the
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Afreeze.
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A
=9A=9A=9A=9A=9A=9A=9A=9A=9A=9AI'm attaching dmesg and lspci logs.
=9A
=9A=9A=9A=9A=9ACiao, Thorsten

