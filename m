Received: from mxout1-he-de.apache.org (mxout1-he-de.apache.org [95.216.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B47F2C82
	for <regressions@lists.linux.dev>; Thu,  2 Dec 2021 15:01:39 +0000 (UTC)
Received: from mail.apache.org (mailroute1-lw-us.apache.org [207.244.88.153])
	by mxout1-he-de.apache.org (ASF Mail Server at mxout1-he-de.apache.org) with SMTP id 8E58761192
	for <regressions@lists.linux.dev>; Thu,  2 Dec 2021 14:55:46 +0000 (UTC)
Received: (qmail 21146 invoked by uid 99); 2 Dec 2021 14:55:46 -0000
Received: from mailrelay1-he-de.apache.org (HELO mailrelay1-he-de.apache.org) (116.203.21.61)
    by apache.org (qpsmtpd/0.29) with ESMTP; Thu, 02 Dec 2021 14:55:46 +0000
Received: from [10.23.2.106] (unknown [51.154.28.112])
	by mailrelay1-he-de.apache.org (ASF Mail Server at mailrelay1-he-de.apache.org) with ESMTPSA id 3284E3E823;
	Thu,  2 Dec 2021 14:55:45 +0000 (UTC)
Message-ID: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>
Subject: Regression: plugging in USB scanner breaks all USB functionality
From: Robert Munteanu <rombert@apache.org>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: tiwai@suse.com, regressions@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 02 Dec 2021 15:55:44 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

After updating from kernel 5.14.11 to 5.14.14 I am seeing the following
problem:

When plugging in an USB scanner ( Brother DSMobile DS-740D ) to my
Lenovo P52 laptop I lose connection to all USB devices. Not only are
the devices no longer available on the host, but no power is drawn by
them. Only a reboot fixes the problem.

The scanner is the only device that triggers the problem, even when it
is the only device plugged in. I have a host of other devices,
connected either directly or via a USB hub in my monitor:

- keyboard
- mouse
- logitech brio webcam
- yubikey
- stream deck
- microphone

None of these cause any issues.
I have tried the following kernels ( packaged for openSUSE Tumbleweed
), and none of them fixed the issue:

- 5.15.2
- 5.15.5
- 5.16~rc3-1.1.ge8ae228

The problem does not appear if the scanner is connected when the laptop
is shutdown. It seems to have an init phase of about 6-7 seconds
(blinking green led) and then stays on. However, it is not detected via
lsusb or scanimage -L.

The problem does not appear on a desktop class machine ( ASUS Prime
X470-PRO/Ryzen 3700x).

The relevant parts of the kernel log seem to be:

Nov 22 11:53:18 rombert kernel: xhci_hcd 0000:00:14.0: Abort failed to stop command ring: -110
Nov 22 11:53:18 rombert kernel: xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
Nov 22 11:53:18 rombert kernel: xhci_hcd 0000:00:14.0: HC died; cleaning up

I've initially reported this at
https://bugzilla.opensuse.org/show_bug.cgi?id=1192569 and CC'ed the
distribution's kernel maintainer.

Please let me know if additional information is needed.

Regards,
Robert Munteanu
