Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F23E3C1E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 20:37:16 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-78f1210e27fso98599241.1
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gsc-game.com; s=google; t=1693687035; x=1694291835; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=48HwCz8O8fa3+/jC4XB/FQHzHO1RzYZUGuOkfmSx/yo=;
        b=PrpAgmXVTjNV4JpAXIaYd007gXjyshSw+B0lW1rDdJMyRAQGwpaaUPfEeM6hBEn/BA
         F/fQe48QMziD1gxgryzb4aTmbmB9NIsbA08tiXMYjxKhBtZoMgW8S3VyEtDUrz4V4zgB
         90JxWDKLiCr6De8Xix9MqkrIOlDKqCmTpDwjxUx6Vjbuse5gjTYDlX/ZbE/33IZE/OeI
         A0+lUq6mmTOrB1PN6jJ56EzDjXmaJ6kYwVHQrX4iuMeIDthS32i8+nUbu7Xa0nuojlVL
         SzM/KrYQjbpKhnnN1ZflxjxqyavfK9Ne/ScSinS++TAjoF09SP9GTnrkI/+SsgnyZDrW
         pIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693687035; x=1694291835;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48HwCz8O8fa3+/jC4XB/FQHzHO1RzYZUGuOkfmSx/yo=;
        b=ie3DNG0mBeJ6KLFSWep7v29lRj/D8lgLgX3ULXDwrV3hj/F3u757fy4pwgM/74EC4y
         mN6gR6BG1B4XF6eG9KreD6RHVTndBW7P20s4xuoBt6dAAc6phiLecHHpgQfln6XPc+zv
         JqqEELoCWVhU/qiXC+m+gGYu4MjWqDKhPxAiQso61PSi3cmQzNlSRc1dJQ11DiBext9I
         /4aaFxE5kZwzcFsD+K1f2kpbv90uoge8ZF9jaf4oBeraerLJRzYYg9hO/+WLSq1AigE/
         LttztzSxFVi2aJ86OKgiOFUVYQXtAT9M35M0svBpSXvQ6s3ITQMoTGbsM/LxsEIiAGM6
         l2FQ==
X-Gm-Message-State: AOJu0YwAUDfksbDzNQGHbjX/J27ESIUcnJj7ZPbenFTWueQXgMqtREMj
	fpKkksZby3roTbPQYKMaru/3mEpGsnymNSqisdFdYd0MkweNrdmb3O0=
X-Google-Smtp-Source: AGHT+IGnP+MvUCiNMU60BC7TS8iqbGSWcuZIQxLidGPUvAxiI6iNbZ5lBTBRYfyZp1xahIIX01KqXu6sTPMWamoNBvw=
X-Received: by 2002:a67:ee0b:0:b0:44e:b396:419e with SMTP id
 f11-20020a67ee0b000000b0044eb396419emr5341057vsp.16.1693687035441; Sat, 02
 Sep 2023 13:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Serguei Ivantsov <manowar@gsc-game.com>
Date: Sat, 2 Sep 2023 22:37:04 +0200
Message-ID: <CAKH+VT3YLmAn0Y8=q37UTDShqxDLsqPcQ4hBMzY7HPn7zNx+RQ@mail.gmail.com>
Subject: DRBD broken in kernel 6.5 and 6.5.1
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

After upgrading the kernel to 6.5 the system can't connect to the peer
(6.4.11) anymore.
I checked 6.5.1 - same issue.
All previous kernels including 6.4.14 are working just fine.
Checking the 6.5 changelog, I found commit
9ae440b8fdd6772b6c007fa3d3766530a09c9045 which mentioned some changes
to DRBD.

On the 6.5.X system I have the following in the kernel log
(drbd_send_block() failed):

[    2.473497] drbd: initialized. Version: 8.4.11 (api:1/proto:86-101)

[    2.475394] drbd: built-in

[    2.477254] drbd: registered as block device major 147

[    7.421400] drbd drbd0: Starting worker thread (from drbdsetup-84 [3844])

[    7.421509] drbd drbd0/0 drbd0: disk( Diskless -> Attaching )

[    7.421552] drbd drbd0: Method to ensure write ordering: flush

[    7.421554] drbd drbd0/0 drbd0: max BIO size = 131072

[    7.421557] drbd drbd0/0 drbd0: drbd_bm_resize called with capacity
== 1845173184

[    7.428017] drbd drbd0/0 drbd0: resync bitmap: bits=230646648
words=3603854 pages=7039

[    7.467370] drbd0: detected capacity change from 0 to 1845173184

[    7.467372] drbd drbd0/0 drbd0: size = 880 GB (922586592 KB)

[    7.486005] drbd drbd0/0 drbd0: recounting of set bits took
additional 0 jiffies

[    7.486010] drbd drbd0/0 drbd0: 0 KB (0 bits) marked out-of-sync by
on disk bit-map.

[    7.486017] drbd drbd0/0 drbd0: disk( Attaching -> UpToDate )

[    7.486021] drbd drbd0/0 drbd0: attached to UUIDs
32DDB2019708F68A:0000000000000000:7D97648599B446DD:7D96648599B446DD

[    7.486863] drbd drbd0: conn( StandAlone -> Unconnected )

[    7.486871] drbd drbd0: Starting receiver thread (from drbd_w_drbd0 [3847])

[    7.486918] drbd drbd0: receiver (re)started

[    7.486929] drbd drbd0: conn( Unconnected -> WFConnection )

[   12.340212] drbd drbd0: initial packet S crossed

[   22.310856] drbd drbd0: Handshake successful: Agreed network
protocol version 101

[   22.311087] drbd drbd0: Feature flags enabled on protocol level:
0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.

[   22.311425] drbd drbd0: conn( WFConnection -> WFReportParams )

[   22.311621] drbd drbd0: Starting ack_recv thread (from drbd_r_drbd0 [4071])

[   22.400702] drbd drbd0/0 drbd0: drbd_sync_handshake:

[   22.400869] drbd drbd0/0 drbd0: self
32DDB2019708F68A:0000000000000000:7D97648599B446DD:7D96648599B446DD
bits:0 flags:0

[   22.401205] drbd drbd0/0 drbd0: peer
32DDB2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD
bits:0 flags:0

[   22.401538] drbd drbd0/0 drbd0: uuid_compare()=0 by rule 40

[   22.401709] drbd drbd0/0 drbd0: peer( Unknown -> Secondary ) conn(
WFReportParams -> Connected ) pdsk( DUnknown -> UpToDate )

[   22.415394] drbd drbd0/0 drbd0: role( Secondary -> Primary )

[   22.506540] drbd drbd0/0 drbd0: _drbd_send_page: size=4096 len=4096 sent=-5

[   22.506773] drbd drbd0: peer( Secondary -> Unknown ) conn(
Connected -> NetworkFailure ) pdsk( UpToDate -> DUnknown )

[   22.507109] drbd drbd0/0 drbd0: new current UUID
7F8B15C04AF49C4D:32DDB2019708F68B:7D97648599B446DD:7D96648599B446DD

[   22.507451] drbd drbd0: ack_receiver terminated

[   22.507588] drbd drbd0: Terminating drbd_a_drbd0

[   22.600693] drbd drbd0: Connection closed

[   22.600937] drbd drbd0: conn( NetworkFailure -> Unconnected )

[   22.601115] drbd drbd0: receiver terminated

[   22.601238] drbd drbd0: Restarting receiver thread

[   22.601378] drbd drbd0: receiver (re)started

[   22.601508] drbd drbd0: conn( Unconnected -> WFConnection )

[   23.260624] drbd drbd0: Handshake successful: Agreed network
protocol version 101

[   23.260859] drbd drbd0: Feature flags enabled on protocol level:
0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.

[   23.261187] drbd drbd0: conn( WFConnection -> WFReportParams )

[   23.261367] drbd drbd0: Starting ack_recv thread (from drbd_r_drbd0 [4071])

[   23.340593] drbd drbd0/0 drbd0: drbd_sync_handshake:

[   23.340771] drbd drbd0/0 drbd0: self
7F8B15C04AF49C4D:32DDB2019708F68B:7D97648599B446DD:7D96648599B446DD
bits:1 flags:0

[   23.341192] drbd drbd0/0 drbd0: peer
32DDB2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD
bits:0 flags:0

[   23.341649] drbd drbd0/0 drbd0: uuid_compare()=1 by rule 70

[   23.341824] drbd drbd0/0 drbd0: peer( Unknown -> Secondary ) conn(
WFReportParams -> WFBitMapS ) pdsk( DUnknown -> Consistent )

[   23.344911] drbd drbd0/0 drbd0: send bitmap stats [Bytes(packets)]:
plain 0(0), RLE 23(1), total 23; compression: 100.0%

[   23.396792] drbd drbd0/0 drbd0: receive bitmap stats
[Bytes(packets)]: plain 0(0), RLE 23(1), total 23; compression: 100.0%

[   23.397210] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
before-resync-source minor-0

[   23.407965] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
before-resync-source minor-0 exit code 0 (0x0)

[   23.417547] drbd drbd0/0 drbd0: conn( WFBitMapS -> SyncSource )
pdsk( Consistent -> Inconsistent )

[   23.426697] drbd drbd0/0 drbd0: Began resync as SyncSource (will
sync 4 KB [1 bits set]).

[   23.435638] drbd drbd0/0 drbd0: updated sync UUID
7F8B15C04AF49C4D:32DEB2019708F68B:32DDB2019708F68B:7D97648599B446DD

[   23.488608] drbd drbd0/0 drbd0: _drbd_send_page: size=4096 len=4096 sent=-5

[   23.498182] drbd drbd0/0 drbd0: drbd_send_block() failed

[   23.508498] drbd drbd0: peer( Secondary -> Unknown ) conn(
SyncSource -> NetworkFailure )

[   23.517597] drbd drbd0: ack_receiver terminated

[   23.527513] drbd drbd0: Terminating drbd_a_drbd0

[   23.690598] drbd drbd0: Connection closed

[   23.701857] drbd drbd0: conn( NetworkFailure -> Unconnected )

[   23.712017] drbd drbd0: receiver terminated

[   23.721597] drbd drbd0: Restarting receiver thread



On the peer:


[349071.038278] drbd drbd0: conn( Unconnected -> WFConnection )

[349071.558245] drbd drbd0: Handshake successful: Agreed network
protocol version 101

[349071.562105] drbd drbd0: Feature flags enabled on protocol level:
0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.

[349071.569889] drbd drbd0: conn( WFConnection -> WFReportParams )

[349071.573802] drbd drbd0: Starting ack_recv thread (from drbd_r_drbd0 [2660])

[349071.688547] drbd drbd0/0 drbd0: drbd_sync_handshake:

[349071.692323] drbd drbd0/0 drbd0: self
3375B2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD
bits:1 flags:0

[349071.699871] drbd drbd0/0 drbd0: peer
7F8B15C04AF49C4D:3375B2019708F68B:3374B2019708F68B:3373B2019708F68B
bits:1 flags:0

[349071.707687] drbd drbd0/0 drbd0: uuid_compare()=-1 by rule 50

[349071.711563] drbd drbd0/0 drbd0: Becoming sync target due to disk states.

[349071.715381] drbd drbd0/0 drbd0: peer( Unknown -> Primary ) conn(
WFReportParams -> WFBitMapT ) pdsk( DUnknown -> UpToDate )

[349071.723039] drbd drbd0/0 drbd0: receive bitmap stats
[Bytes(packets)]: plain 0(0), RLE 23(1), total 23; compression: 100.0%

[349071.732489] drbd drbd0/0 drbd0: send bitmap stats
[Bytes(packets)]: plain 0(0), RLE 23(1), total 23; compression: 100.0%

[349071.740178] drbd drbd0/0 drbd0: conn( WFBitMapT -> WFSyncUUID )

[349071.787113] drbd drbd0/0 drbd0: updated sync uuid
3376B2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD

[349071.794907] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
before-resync-target minor-0

[349071.800006] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
before-resync-target minor-0 exit code 0 (0x0)

[349071.807737] drbd drbd0/0 drbd0: conn( WFSyncUUID -> SyncTarget )

[349071.811639] drbd drbd0/0 drbd0: Began resync as SyncTarget (will
sync 4 KB [1 bits set]).

[349071.916117] drbd drbd0: sock was shut down by peer

[349071.919955] drbd drbd0: peer( Primary -> Unknown ) conn(
SyncTarget -> BrokenPipe ) pdsk( UpToDate -> DUnknown )

[349071.927796] drbd drbd0: short read (expected size 4096)

[349071.931812] drbd drbd0: error receiving RSDataReply, e: -5 l: 4096!

[349071.935864] drbd drbd0: ack_receiver terminated

[349071.939906] drbd drbd0: Terminating drbd_a_drbd0

[349072.088385] drbd drbd0: Connection closed

[349072.092398] drbd drbd0: conn( BrokenPipe -> Unconnected )

[349072.096436] drbd drbd0: receiver terminated

[349072.100469] drbd drbd0: Restarting receiver thread

[349072.104454] drbd drbd0: receiver (re)started

[349072.108373] drbd drbd0: conn( Unconnected -> WFConnection )


--

 Best Regards,

 Serguei
