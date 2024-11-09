Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19FB14EC4A
	for <regressions@lists.linux.dev>; Sat,  9 Nov 2024 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731148052; cv=none; b=DkzRLe3+yWGp/jXxy5JU8mVIpIgl1l7daUNvyr++FWfpaOAya9rXIw8uMwFs7bJtJPZC6Ee3O9FrqMl2C6KLgzbs/sOFNAfsqrypeYGSY7d/4pJGydsMkH/2RVr+JeaFUifw3Cr/94oPbI5pD2+knHw2NWeV9KqEPps16TaoF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731148052; c=relaxed/simple;
	bh=5Vja02k66V4oDNX9eIWzmGMB9QHMytgUNfp/8z3yTj0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fX68fqXJq0RlV4pkZPDaQi6ZQ7qR2LLB/uXKcRpUQ7l2I0sLdE0Z182afVVXp4OecA6xj6tqGZ9TsCY4jgvY9jBmSk1egth1s9dnLt3yHuO4UQg2N/31RzrNm5IdKLbuxLuEg4agBgsXynx/iPFk+ns84HJsrITAeJb0Fou8rZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: =?utf-8?Q?Ulrich_M=C3=BCller?= <ulm@gentoo.org>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev,  He Lugang <helugang@uniontech.com>,  Jiri
 Kosina <jkosina@suse.com>
Subject: Re: [REGRESSION] ThinkPad L15 Gen 4 touchpad no longer works
In-Reply-To: <uikt4wwpw@gentoo.org> ("Ulrich =?utf-8?Q?M=C3=BCller=22's?=
 message of "Sun, 03 Nov
	2024 09:24:59 +0100")
References: <uikt4wwpw@gentoo.org>
Date: Sat, 09 Nov 2024 11:27:23 +0100
Message-ID: <ujzdcvh10@gentoo.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>>>>> On Sun, 03 Nov 2024, Ulrich M=C3=BCller wrote:

> After upgrading from 6.6.52 to 6.6.58, tapping on the touchpad stopped
> working. The problem is still present in 6.6.59.

> I see the following in dmesg output; the first line was not there
> previously:

> [    2.129282] hid-multitouch 0018:27C6:01E0.0001: The byte is not expect=
ed for fixing the report descriptor. It's possible that the touchpad firmwa=
re is not suitable for applying the fix. got: 9
> [    2.137479] input: GXTP5140:00 27C6:01E0 as /devices/platform/AMDI0010=
:00/i2c-0/i2c-GXTP5140:00/0018:27C6:01E0.0001/input/input10
> [    2.137680] input: GXTP5140:00 27C6:01E0 as /devices/platform/AMDI0010=
:00/i2c-0/i2c-GXTP5140:00/0018:27C6:01E0.0001/input/input11
> [    2.137921] hid-multitouch 0018:27C6:01E0.0001: input,hidraw0: I2C HID=
 v1.00 Mouse [GXTP5140:00 27C6:01E0] on i2c-GXTP5140:00

> Hardware is a Lenovo ThinkPad L15 Gen 4.

> The problem goes away when reverting this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/hid/hid-multitouch.c?id=3D251efae73bd46b097deec4f9986d926813aed744

Also, it looks like that commit conflated two independent changes:
- It adds some code for I2C_DEVICE_ID_GOODIX_01E0.
- It changes 01E8 (which was duplicate before) to 01E9 in line 2068.

Of course, reverting the first part is enough to fix the problem here.
The revert is now included in Gentoo's sys-kernel/gentoo-sources:
https://gitweb.gentoo.org/proj/linux-patches.git/tree/2600_HID-revert-Y900P=
-fix-ThinkPad-L15-touchpad.patch?h=3D6.6-68

> See also Gentoo bug report: https://bugs.gentoo.org/942797
